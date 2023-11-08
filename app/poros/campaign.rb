class Campaign
  attr_reader :id,
              :name,
              :player_num,
              :themes,
              :user_id

  def initialize(data)
    @id = data[:id]
    @name = data[:attributes][:name]
    @player_num = data[:attributes][:player_num]
    @themes = data[:attributes][:themes]
    @user_id = data[:attributes][:user_id]
  end
end