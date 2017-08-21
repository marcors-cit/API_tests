#language: pt

Dado(/^que eu tenho um novo usuário$/) do                                      
  name = Faker::Superhero.name
  @request = {
      name: name,
      email: Faker::Internet.free_email(name),
      password: 'test#123'
  }

@request = JSON.parse(@request.to_json) ## Parse de JSON para Hash do Ruby para usar as chaves como string
end                                                                            
                                                                               
Dado(/^esse usuário já está cadastrado$/) do
  @result = HTTParty.post(
      'https://ninjarest.herokuapp.com/users',
      :body=> @request.to_json,
      :headers=> {'Content-Type' => 'application/jason'}
    )
end


Dado(/^esse usuário não possui "([^"]*)"$/) do |key|
  @request.delete(key)
end


Quando(/^faço o cadastro$/) do                                                 
  @result = HTTParty.post(
      'https://ninjarest.herokuapp.com/users',
      :body=> @request.to_json,
      :headers=> {'Content-Type' => 'application/jason'}
    )
end
                                                                               
Então(/^vejo este usuário cadastrado no sistema$/) do                          
  result = HTTParty.get(
      'https://ninjarest.herokuapp.com/users',
      query: { email: @request['email'] }      
  )
  
  expect(result.parsed_response.first['id'].size). to eql 24
  # expect(result.parsed_response.first['id']).not_to be_empty
  expect(result.parsed_response.first['name']).to eql @request['name']
  expect(result.parsed_response.first['email']).to eql @request['email']
  expect(result.parsed_response.first['password']).to eql @request['password']

end                                                                            

Então(/^vejo a mensagem "([^"]*)"$/) do |msg|
  expect(@result.parsed_response['message']).to eql msg
end

Dado(/^que eu tenho um novo usuário teste(\d+)$/) do |arg1|
  pending # Write code here that turns the phrase above into concrete actions
end

Dado(/^esse usuário não possui "([^"]*)" teste(\d+)$/) do |arg1, arg2|
  pending # Write code here that turns the phrase above into concrete actions
end

Quando(/^faço o cadastro teste (\d+)$/) do |arg1|
  pending # Write code here that turns the phrase above into concrete actions
end

Então(/^o código de resposta deve ser "([^"]*)" teste(\d+)$/) do |arg1, arg2|
  pending # Write code here that turns the phrase above into concrete actions
end

Então(/^vejo a mensagem "([^"]*)" teste(\d+)$/) do |arg1, arg2|
  pending # Write code here that turns the phrase above into concrete actions
end