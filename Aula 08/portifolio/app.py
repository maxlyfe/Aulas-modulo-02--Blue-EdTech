from flask import Flask,render, request, redirect
from flask_mail import Mail, Message #pip install Flask-Mail


app = Flask(__name__)

mail_settings = {
    "MAIL_SERVER" : 'smtp.gmail.com',
    "MAIL_PORT": 465,
    "MAIL_USE_TLS": False,
    "MAIL_USE_SSL": True,
    "MAIL_USERNAME": '', #Seu e-mail
    "MAIL_PASSWORD": '', #Sua senha
}

app.config.update(mail_settings) #Atualiza as configurações do app

mail = Mail(app) 

class Contato:
    def __init__(self, nome, email, mensagem):
        self.nome = nome
        self.email = email
        self.mensagem = mensagem

@app.route('/')
def index():
    return render_template('index.html')

@app.route('/send', methods=['POST', 'GET'])
def send():
    if request.method == 'POST':
        contato = Contato(
            request.form['nome'],
            request.form['email'],
            request.form['mensagem']
        )

        msg = Message(
            subject='Contato do portfólio',
            sender= app.config.get('MAIL_USERNAME'), #Meu email que vou usar para enviar o formulario
            recipient=[app.config.get('MAIL_USERNAME')], #Os e-mails que vão receber esta mensagem.
            body= f'''
                {contato.nome} com o e-mail {contato.email}, enviou a seguinte mensagem:
                
                {contato.mensagem}
            '''
        )
        mail.send(msg)
    return render_template('')

if __name__ == '__main__':
    app.run(debug=True)