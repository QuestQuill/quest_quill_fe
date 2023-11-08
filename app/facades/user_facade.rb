class UserFacade
  def initialize(user)
    @user = user
  end

  def login_user(credentials)
    json = service.login_authorization(credentials)

    json[:user_id]
  end

  def user
    json = service.get_user(@user[:data])

    User.new(json)
  end

  def create_user(params)
    json = service.post_user(params)
    
    if !json.nil?
      User.new(json)
    else
      nil
    end
  end

  def service
    DndService.new
  end
end