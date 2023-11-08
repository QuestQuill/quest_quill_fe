class DndService
  def get_user(user)
    get_url("/api/v1/users/#{user}")
  end

  def login_authorization(credentials)
    response = conn.post("/api/v1/users/login") do |req|
      req.params["email"] = credentials[:email]
      req.params["password"] = credentials[:password]
    end

    JSON.parse(response.body, symbolize_names: true)
  end

  def post_user(params)
    response = conn.post("/api/v1/users") do |req|
      req.params["email"] = params[:email]
      req.params["username"] = params[:username]
      req.params["password"] = params[:password]
    end

    if response.status == 200
      JSON.parse(response.body, symbolize_names: true)
    else
      nil
    end
  end

  def search_user(params)
    if params[:email]
      response = conn.get("/api/v1/users/search?email=#{params[:email]}")
    elsif params[:token]
      response = conn.get("/api/v1/users/search?token=#{params[:token]}")
    end

    if response.status == 200
      JSON.parse(response.body, symbolize_names: true)
    else
      nil
    end
  end

  def update_token(user, token)
    response = conn.patch("/api/v1/users/update_token?user=#{user}&token=#{token}")

    JSON.parse(response.body, symbolize_names: true)
  end
  
  def get_url(url)
    response = conn.get(url)
    
    JSON.parse(response.body, symbolize_names: true)
  end

  def conn
    Faraday.new(url: "https://quest-quill-api.onrender.com")
    # Faraday.new(url: "http://localhost:3000")
  end

  def post_campaign(params)
    response = conn.post("/api/v1/users/#{params[:user_id]}/campaigns") do |req|
      req.params["name"] = params[:name]
      req.params["player_num"] = params[:player_num]
      req.params["themes"] = params[:themes]
      req.params["user_id"] = params[:user_id]
    end

    if response.status == 200
      JSON.parse(response.body, symbolize_names: true)
    else
      nil
    end
  end

  def get_campaign(campaign)
    get_url("/api/v1/users/#{user}/campaigns#{campaign}")
  end
end