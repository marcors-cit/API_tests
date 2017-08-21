#encoding: utf-8
# Site com comandos rspec:
# https://relishapp.com/rspec/rspec-expectations/v/3-6/docs/built-in-matchers/equality-matchers

Quando(/^faço uma consulta$/) do
  @result = HTTParty.get('https://ninjarest.herokuapp.com/users')
end

Então(/^o código de resposta deve ser "([^"]*)"$/) do |status_code|
  expect(@result.response.code).to eql status_code
end

Então(/^o sistema retorna uma lista de usuários cadastrados$/) do
  $res = @result.parsed_response
end

Então(/^a lista retornada não está vazia$/) do
  $res = @result.parsed_response 
  expect($res).not_to be_empty
end

Então(/^a lista retornada contém estrutura com \(id, name, email, password\)$/) do
  $res = @result.parsed_response 
  $res.each do |a|
    # puts a['id'].class
    # puts a['name'].class
    # puts a['email'].class
    # puts a['password'].class
    expect(a).to have_key('id')
    expect(a).to have_key('name')
    expect(a).to have_key('email')
    expect(a).to have_key('password')
  end
end


# @4_listaAleatoria
Dado(/^que eu tenho um usuário cadastrado \(listaAleatoria\)$/) do                  
  list = HTTParty.get('https://ninjarest.herokuapp.com/users')
  @user = list.parsed_response.sample
  @user_id = @user['id']
end                                                                                      
                                                                                         
Quando(/^faço a consulta desse usuário \(listaAleatoria\)$/) do                     
  @result = HTTParty.get("https://ninjarest.herokuapp.com/users/#{@user_id}")
end                                                                                      
                                                                                         
Então(/^o código de resposta deve ser "([^"]*)" \(listaAleatoria\)$/) do |status_code|     
  expect(@result.response.code).to eql status_code
end                                                                                      
                                                                                         
Então(/^o sistema retorna os dados desse usuário \(listaAleatoria\)$/) do           
  puts @user_id
  expect(@result.parsed_response).to eql @user
end                                                                                      



# # @4.1_marretado
# Dado(/^que eu tenho um usuário cadastrado \(marretado\)$/) do                  
#   @user = {
#     "id" => '5957ecee328d180004b7a40e',
#     "name" => 'Matheus Barros',
#     "email" => 'barros.matheus@gmail.com',
#     "password" => 'secret'
#   }
# end
                                                                                         
# Quando(/^faço a consulta desse usuário \(marretado\)$/) do                     
#   @result = HTTParty.get("https://ninjarest.herokuapp.com/users/#{@user["id"]}")
# end                                                                                      
                                                                                         
# Então(/^o código de resposta deve ser "([^"]*)" \(marretado\)$/) do |status_code|     
#   expect(@result.response.code).to eql status_code
# end                                                                                      
                                                                                         
# Então(/^o sistema retorna os dados desse usuário \(marretado\)$/) do           
#   expect(@result.parsed_response).to eql(@user)
# end                                                                                      




# @5_gemFaker
Dado(/^que o usuário não está cadastrado \(gemFaker\)$/) do
  @user_id = Faker::Crypto.md5
end

Quando(/^faço a consulta desse usuário \(gemFaker\)$/) do
  @result = HTTParty.get("https://ninjarest.herokuapp.com/users/#{@user_id}")
end                                                                                      

Então(/^o código de resposta deve ser "([^"]*)" \(gemFaker\)$/) do |status_code|
  expect(@result.response.code).to eql status_code
end                                                                                      

Então(/^vejo a mensagem "([^"]*)" \(gemFaker\)$/) do |msg|
  expect(@result.parsed_response['message']).to eql msg
end



# @5_marretado
# Dado(/^que o usuário não está cadastrado \(marretado\)$/) do
#   @user_id = 123455
#     # @user = list.parsed_response.sample
# end

# Quando(/^faço a consulta desse usuário \(marretado\)$/) do
#   @result = HTTParty.get("https://ninjarest.herokuapp.com/users/#{@user_id}")
# end

# Então(/^o código de resposta deve ser "([^"]*)" \(marretado\)$/) do |status_code|
#   expect(@result.response.code).to eql status_code
# end

# Então(/^vejo a mensagem "([^"]*)" \(marretado\)$/) do |msg|
#    expect(@result.parsed_response['message']).to eql msg
#   # puts @result.parsed_response
# end


# @6
Dado(/^que eu tenho um usuário cadastrado$/) do
  list = HTTParty.get('https://ninjarest.herokuapp.com/users')
  @user = list.parsed_response.sample
  @user_id = @user['id']
end

Quando(/^faço a consulta desse usuário por email$/) do
  @result = HTTParty.get(
    'https://ninjarest.herokuapp.com/users',
    query: { email: @user['email'] }
  ) 
########################################################################################################
  #convertendo o Hash para "objeto hash" dentro de um Array
  # (comentado após utilizar o .first na linha 150: expect(@result.parsed_response.first).to eql @user

  # a = Array.new
  # a.push(@user)
  # @user = a
########################################################################################################
end

Então(/^o sistema retorna os dados desse usuário$/) do
  puts @user
  puts @result.parsed_response
  expect(@result.parsed_response.first).to eql @user
end



