class User
  attr_reader :id,
              :username,
              :email,
              :token,
              :token_expiration

  def initialize(data)
    @id = data[:id]
    @username = data[:attributes][:username]
    @email = data[:attributes][:email]
    @token = data[:attributes][:token]
    @token_expiration = data[:attributes][:token]
  end
end