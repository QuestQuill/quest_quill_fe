class SessionsController < ApplicationController
  def create
    client_id = "a410938a038ee6341547"
    client_secret = "dd16c6ae87e731fcea362cfc180debc543689d6c"
    code = params[:code]
    
    conn = Faraday.new(url: "https://github.com", headers: { "Accept": "application/json" })

    response = conn.post("/login/oauth/access_token") do |req|
      req.params["code"] = code
      req.params['client_id'] = client_id
      req.params['client_secret'] = client_secret
    end

    data = JSON.parse(response.body, symbolize_names: true)
    access_token = data[:access_token]

    conn = Faraday.new(
      url: "https://api.github.com",
      headers: {
        "Authorization": "token #{access_token}"
      }
    )

    response = conn.get("/user")
    data = JSON.parse(response.body, symbolize_names: true)

    user = user_facade.github_auth(
      {
        uid: data[:id],
        login: data[:login],
        access_token: access_token
      }
    )

    session[:user_id] = user.id
    redirect_to user_path(user.id)
  end

  def user_facade
    UserFacade.new(params[:id])
  end
end