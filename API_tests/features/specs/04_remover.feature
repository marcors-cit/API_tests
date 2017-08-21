#language: pt

@delete
Funcionalidade: Remover usuário

@new_user
Cenário: Remover usuário cadastrado

    Quando faço a exclusão pelo identificador do usuário
    Então o código de resposta deve ser "200"
        E esse usuário não deve ser exibido na consulta


Cenário: Tentativa de Remoção de usuário não cadastrado

    Dado que o usuário não está cadastrado
    Quando faço a exclusão pelo identificador do usuário
    Então o código de resposta deve ser "404"
    E vejo a mensagem "Usuário não encontrado!"