#encoding: utf-8

Quando(/^faço uma consulta\.$/) do
    @result = HTTParty.get('https://ninjarest.herokuapp.com/users')
end

Então(/^o código de resposta deve ser "([^"]*)"\.$/) do |status_code|
    expect(@result.response.code).to eql status_code
end

Então(/^o sistema retorna uma lista de usuários cadastrados\.$/) do
    puts @res = @result.parsed_response
end