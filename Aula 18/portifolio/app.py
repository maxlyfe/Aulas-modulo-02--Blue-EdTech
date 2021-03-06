# Dica, crie um gmail especifico para essa atividade, para não compromoter a integridade do seu gmail pessoal.

#Após a criação configure os acesso em seu gmail:
   # Permitir aplicativos menos seguros (Ativar): https://myaccount.google.com/lesssecureapps
   # Desbloquear acesso os gmail: https://accounts.google.com/b/2/DisplayUnlockCaptcha
   # Ativar o acesso via IMAP: https://mail.google.com/mail/#settings/fwdandpop
# A verificação de duas etapas deve estar desativada, caso o contrário, você precisará configurar uma senha de app e colocar essa senha aqui.


from flask import Flask, flash,render_template, redirect, request, flash, session
from flask_mail import Mail, Message #pip install Flask-Mail
from config import *
from flask_sqlalchemy import SQLAlchemy


app = Flask(__name__)
app.secret_key = 'bluedtech'

mail_settings = {
    "MAIL_SERVER" : 'smtp.gmail.com',
    "MAIL_PORT": 465,
    "MAIL_USE_TLS": False,
    "MAIL_USE_SSL": True,
    "MAIL_USERNAME": 'maxblueedtech@gmail.com', #Seu e-mail
    "MAIL_PASSWORD": 'max@blue', #Sua senha
}

app.config.update(mail_settings) #Atualiza as configurações do app

mail = Mail(app) 

app.config['SQLALCHEMY_DATABASE_URI'] = url_SQLAlchemy
db = SQLAlchemy(app)

class Contato:
    def __init__(self, nome, email, mensagem):
        self.nome = nome
        self.email = email
        self.mensagem = mensagem

#----------------------------------------------------------
class Projeto(db.Model):
    id = db.Column(db.Integer, primary_key = True, autoincrement = True)
    nome = db.Column(db.String(150), nullable = False)
    imagem = db.Column(db.String(500), nullable = False)
    descricao = db.Column(db.String(500), nullable = False)
    link = db.Column(db.String(300), nullable=False)

    def __init__(self, nome, imagem, descricao, link):
        self.nome = nome
        self.imagem = imagem
        self.descricao = descricao
        self.link = link
#----------------------------------------------------------------
@app.route('/')
def index():
   session['user_logado'] = None
   projetos = Projeto.query.all()  # Busca todos os projetos no banco e coloca na veriável projetos, que se transforma em uma lista.
   return render_template('index.html', projetos=projetos) # Renderiza a página index.html mandando a lista de projetos


@app.route('/adm')
def adm():
    if 'user_logado' not in session or session['user_logado'] == None:
        flash('Faça o login antes de ingressar neste site!')
        return redirect('/login')

    projetos = Projeto.query.all() # CRUD - READ ALL (LER TODOS)
    return render_template('adm.html', projetos = projetos)

#CRUD - CREATE
@app.route('/new', methods=['GET', 'POST'])
def new():
    if request.method == 'POST':
        projeto = Projeto(
            request.form['nome'],
            request.form['imagem'],
            request.form['descricao'],
            request.form['link']
        )
        db.session.add(projeto)
        db.session.commit()
        flash('Enviado.')
        return redirect('/adm')


# CRUD - DELETE
@app.route('/delete/<id>')
def delete(id):
    projeto = Projeto.query.get(id)
    db.session.delete(projeto)
    db.session.commit()
    flash('Projeto apagado com sucesso')
    return redirect('/adm')


#CRUD - EDITAR



# Autenticação e Login
@app.route('/login')
def login():
    return render_template('login.html')

@app.route('/auth', methods=['GET', 'POST'])
def auth():
    if request.form['senha']== 'admin':
        session['user_logado'] = 'logado'
        flash('Login feito com sucesso!')
        return redirect('/adm')
    else:
        flash('Erro no login, tente novamente!')
        return redirect('/login')




@app.route('/send', methods=['GET', 'POST'])
def send():
    if request.method == 'POST':
        formContato = Contato(
            request.form['nome'],
            request.form['email'],
            request.form['mensagem']
        )

        msg = Message(
            subject='Contato do portfólio',
            sender= app.config.get('MAIL_USERNAME'), #Meu email que vou usar para enviar o formulario
            recipients=[app.config.get('MAIL_USERNAME'),('maximilianolyfbuzios@gmail.com')], #Os e-mails que vão receber esta mensagem.
            body= f'''
                {formContato.nome} com o e-mail {formContato.email}, enviou a seguinte mensagem:
                
                {formContato.mensagem}
            '''
        )
        mail.send(msg)
    return render_template('send.html', formContato=formContato)

if __name__ == '__main__':
    db.create_all() # Cria o banco de dados assim que a aplicação é ligada
    app.run(debug=True)
