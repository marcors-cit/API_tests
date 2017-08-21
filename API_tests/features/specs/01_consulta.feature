#language: pt

@get
Funcionalidade: Consulta de usuários

@1
Cenario: Obter lista de usuários 
    Quando faço uma consulta
    Então o código de resposta deve ser "200"
    E o sistema retorna uma lista de usuários cadastrados

@2
Cenario: Validar retorno com dados (não vazio!)
    Quando faço uma consulta
    Então o código de resposta deve ser "200"
    E a lista retornada não está vazia

@3
Cenario: Validar estrutura da Response
    Quando faço uma consulta
    Então o código de resposta deve ser "200"
    E a lista retornada contém estrutura com (id, name, email, password)
   
@4_listaAleatoria
Cenario: Obter um único usuário válido (listaAleatoria)
    Dado que eu tenho um usuário cadastrado (listaAleatoria)
    Quando faço a consulta desse usuário (listaAleatoria)
    Então o código de resposta deve ser "200" (listaAleatoria)
    E o sistema retorna os dados desse usuário (listaAleatoria)


# @4.1_marretado
# Cenario: Obter um único usuário válido (marretado)
    # Dado que eu tenho um usuário cadastrado (marretado)
    # Quando faço a consulta desse usuário (marretado)
    # Então o código de resposta deve ser "200" (marretado)
    # E o sistema retorna os dados desse usuário (marretado)


@5_gemFaker
Cenario: Usuário não cadastrado (gemFaker)
    Dado que o usuário não está cadastrado (gemFaker)
    Quando faço a consulta desse usuário (gemFaker)
    Então o código de resposta deve ser "404" (gemFaker)
    E vejo a mensagem "Usuário não encontrado!" (gemFaker)


# @5_marretado
# Cenario: Usuário não cadastrado (marretado)
    # Dado que o usuário não está cadastrado (marretado)
    # Quando faço a consulta desse usuário (marretado)
    # Então o código de resposta deve ser "404" (marretado)
    # E vejo a mensagem "Usuário não encontrado!" (marretado)

@6
Cenario: Consulta por email do usuario
    Dado que eu tenho um usuário cadastrado
    Quando faço a consulta desse usuário por email
    Então o código de resposta deve ser "200"
    E o sistema retorna os dados desse usuário



@6
Cenario: Consulta por email do usuario4
    Dado que eu tenho um usuário cadastrado4
    Quando faço a consulta desse usuário por email4
    Então o código de resposta deve ser "200"4
    E o sistema retorna os dados desse usuário4