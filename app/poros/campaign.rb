class Campaign
  attr_reader :name,
              :player_num,
              :themes

  def initialize(data)
    @name = data[:name]
    @player_num = data[:player_num]
    @themes = data[:themes]
  end
end