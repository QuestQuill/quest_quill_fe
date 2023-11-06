class User
  attr_reader :id,
              :username,
              :email

  def initialize(data)
    @id = data[:id]
    @username = data[:username]
    @email = data[:email]
  end
end