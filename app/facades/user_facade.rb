class UserFacade
  def initialize(user)
    @user = user
  end

  def login_user(credentials)
    json = service.login_authorization(credentials)

    json[:user_id]
  end

  def user
    json = service.get_user(@user)

    User.new(json[:data])
  end

  def create_user(params)
    json = service.post_user(params)

    if !json.nil?
      User.new(json[:data])
    else
      nil
    end
  end

  def search_user(params)
    json = service.search_user(params)
    
    if json
      User.new(json[:data].first)
    else
      nil
    end
  end

  def update_token(user, token)
    json = service.update_token(user.id, token)
    
    User.new(json[:data])
  end

  def service
    DndService.new
  end
end