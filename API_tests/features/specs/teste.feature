#language: pt

@get
Funcionalidade: Consulta de usuários.

@doc
Cenario: Obter lista de usuários .
    Quando faço uma consulta.
    Então o código de resposta deve ser "200".
    E o sistema retorna uma lista de usuários cadastrados.