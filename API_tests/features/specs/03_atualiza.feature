#language: pt

@put
Funcionalidade: Atualizar campos do usuário

@new_user
Cenário: Atualização do campo "email" em usuário criado e na sequência atualização do campo "nome" neste mesmo usuário
    
    Quando faço a atualização (email) pelo identificador do usuário
    Então o código de resposta deve ser "200"
        E o dado alterado (email) deve ser exibido na consulta

    Quando faço a atualização (nome) pelo identificador do usuário
    Então o código de resposta deve ser "200"
        E o dado alterado (nome) deve ser exibido na consulta

@new_user
Cenário: Atualização somente do campo "email" em novo usuário criado
    Quando faço a atualização (email) pelo identificador do usuário
    Então o código de resposta deve ser "200"
        E o dado alterado (email) deve ser exibido na consulta

@new_user
Cenário: Atualização somente do campo "nome" em novo usuário criado
    Quando faço a atualização (nome) pelo identificador do usuário
    Então o código de resposta deve ser "200"
        E o dado alterado (nome) deve ser exibido na consulta