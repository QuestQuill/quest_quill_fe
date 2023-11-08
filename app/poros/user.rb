class User
  attr_reader :id,
              :uid,
              :username,
              :email,
              :token,
              :token_expiration,
              :auth_token,
              :campaigns

  def initialize(data)
    @id = data[:id]
    @uid = data[:attributes][:uid]
    @username = data[:attributes][:username]
    @email = data[:attributes][:email]
    @token = data[:attributes][:token]
    @token_expiration = data[:attributes][:token_expiration]
    @auth_token = data[:attributes][:auth_token]
    @campaigns = data[:attributes][:campaigns]
  end
end