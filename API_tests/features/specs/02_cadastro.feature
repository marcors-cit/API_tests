#language: pt

@post
Funcionalidade: Cadastro de usuários

Cenario: Cadastro de novo usuário

    Dado que eu tenho um novo usuário
    Quando faço o cadastro
    Então o código de resposta deve ser "200"
    E vejo este usuário cadastrado no sistema

Cenario: Usuário já cadastrado

    Dado que eu tenho um novo usuário
        Mas esse usuário já está cadastrado
    Quando faço o cadastro
    Então o código de resposta deve ser "409"
        E vejo a mensagem "Email já cadastrado9!"
    
Cenario: Email deve ser obrigatório

    Dado que eu tenho um novo usuário
        Mas esse usuário não possui "email"
    Quando faço o cadastro
    Então o código de resposta deve ser "409"
        E vejo a mensagem "Email deve ser obrigatório!"

Cenario: Nome deve ser obrigatório

    Dado que eu tenho um novo usuário
        Mas esse usuário não possui "name"
    Quando faço o cadastro
    Então o código de resposta deve ser "409"
        E vejo a mensagem "Nome deve ser obrigatório!"

Cenario: Senha deve ser obrigatório

    Dado que eu tenho um novo usuário
        Mas esse usuário não possui "password"
    Quando faço o cadastro
    Então o código de resposta deve ser "409"
        E vejo a mensagem "Senha deve ser obrigatório!"
    
