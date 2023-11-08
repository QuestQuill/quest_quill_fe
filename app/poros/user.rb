class User
  attr_reader :id,
              :username,
              :email,
              :token,
              :token_expiration,
              :campaigns

  def initialize(data)
    @id = data[:id]
    @username = data[:attributes][:username]
    @email = data[:attributes][:email]
    @token = data[:attributes][:token]
    @token_expiration = data[:attributes][:token]
    @campaigns = data[:attributes][:campaigns]
  end
end