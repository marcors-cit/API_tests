Before('@new_user') do

    name = Faker::Superhero.name
    @request = {
        name: name,
        email: Faker::Internet.free_email(name),
        password: 'test#123'
    }


    HTTParty.post(
        'https://ninjarest.herokuapp.com/users',
        :body=> @request.to_json,
        :headers=> {'Content-Type' => 'application/jason'}
    )

    
  result = HTTParty.get(
      'https://ninjarest.herokuapp.com/users',
      query: { email: @request[:email] }      
  )

  puts @user = result.parsed_response.first  
  @user = result.parsed_response.first
  @user_id = @user['id']
  puts @user_id = @user['id']

end
