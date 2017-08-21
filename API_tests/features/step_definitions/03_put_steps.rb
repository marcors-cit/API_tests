#language: pt

Quando(/^faço a atualização \(email\) pelo identificador do usuário$/) do
  name = Faker::Superhero.name
  @request = {
      name: name,
      email: name+'.alterado@gmail.com',
      password: 'test#123'
  }  

   @result = HTTParty.put(
    'https://ninjarest.herokuapp.com/users/' + @user_id,
     :body=> @request.to_json,
    )

@request = JSON.parse(@request.to_json) ## Parse de JSON para Hash do Ruby para usar as chaves como string
end



Então(/^o dado alterado \(email\) deve ser exibido na consulta$/) do
  result = HTTParty.get(
      'https://ninjarest.herokuapp.com/users/'+ @user_id,
      query: { email: @request['email'] }      
  )
  
  puts (result.parsed_response['email'])
  puts @request['email']
  expect(result.parsed_response['email']).to eql @request['email']
end



#nome
Quando(/^faço a atualização \(nome\) pelo identificador do usuário$/) do
  # name = Faker::Superhero.name
  @request = {
      name: 'alterado',
      # email: name+'.alterado@gmail.com',
      # password: 'test#123'
  }  

   @result = HTTParty.put(
    'https://ninjarest.herokuapp.com/users/' + @user_id,
     :body=> @request.to_json,
  )

@request = JSON.parse(@request.to_json) ## Parse de JSON para Hash do Ruby para usar as chaves como string
end



Então(/^o dado alterado \(nome\) deve ser exibido na consulta$/) do
  result = HTTParty.get(
      'https://ninjarest.herokuapp.com/users/'+ @user_id,
      query: { name: @request['name'] }      
  )
  
  puts (result.parsed_response['name'])
  puts (result.parsed_response['email'])
  puts @request['name']
  puts @request['email']
  expect(result.parsed_response['name']).to eql @request['name']
end