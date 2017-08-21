#encoding: utf-8

Quando(/^faço a exclusão pelo identificador do usuário$/) do
  @result = HTTParty.delete(
    'https://ninjarest.herokuapp.com/users/' + @user_id
  )  
end

Então(/^esse usuário não deve ser exibido na consulta$/) do
    result = HTTParty.get(
      'https://ninjarest.herokuapp.com/users',
      query: { email: @user['email'] }      
  )

  expect(result.parsed_response). to be_empty ##Ao consultar por email deletado a API retorna 200 porém vazio
end



Dado(/^que o usuário não está cadastrado$/) do
  @user_id = Faker::Crypto.md5
end
