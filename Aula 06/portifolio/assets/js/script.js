
let inputNome = document.querySelector('#nome')
let botao = document.querySelector('#enviar')

inputNome.addEventListener('keyup', () => {
    if (inputNome.value.length < 2) { /* se o tamanho do valor que recebemos no imput é menor a 2 */
        inputNome.style.borderColor = 'red' /* "se Sim" mudar a borda a vermelho */
    } else {
        inputNome.style.borderColor = 'green' /* "Se Não" colocar a cor verde */
    }
    if (inputNome.value == '' || inputNome.value == null){ /* Se o valor for nulo voltar a cor para o normal. */
        inputNome.style.borderColor = '#ccc'
    }
})
botao.addEventListener('click', () =>{
    alert('Mensagem Enviada!')
})





//// --------------------------------- //// // ----------------------------------------------------//
// // cria a variavel input nome e coloca nela o elemento que possui o id nome
// let inputNome = document.querySelector('#nome')
// let inputEmail = document.querySelector('#email')
// let texareaMensagem = document.querySelector('#mensagem')
// let btnEnviar = document

// // Só posso utilizar a arrow faction (=>) quando a função não tem nome
// inputNome?.addEventListener('keyup', () =>{
//     if (inputNome.value.length < 2){ //Enquanto o inputnome for menor que 2 vai rodar a linha de baixo
//         inputNome.style.borderColor = 'red' // se o input for menor a 2 vai ficar com a borda vermelha
//     } else{ //Senão
//         inputNome.style.borderColor = 'green'  // fica com a borda verde
//     }
// }) // fechamos o bloco----------------------------------------------------------------------------

// // aqui em baixo estamos chamando a função que esta no html, por boas praticas o html tem que ficar limpo e criar a função aqui no js
// // onkeyup='mostraValor()' isto deveria estar no nosso input no html
// // function mostraValor(){
// //     console.log(inputNome.nomeValue)
// // }

// inputEmail.addEventListener('keyup', () =>{
//     if(inputEmail.value.indexOf('@') == -1 || inputEmail.value.indexOf('.') == -1 ||){
//         inputEmail.style.borderColor = 'red'
//     } else {
//         inputEmail.style.borderColor = 'green'
//     }
// })

// texareaMensagem.addEventListener('keyup', ()=>{
//     if texareaMensagem.value.length > 100){
//         textareaMensagem.style.borderColor = 'red'
//     }else{
//         texareaMensagem.style.borderColor = 'green'
//     }
// })