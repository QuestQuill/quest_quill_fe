class Quest
  attr_reader :id,
              :name,
              :description,
              :goal,
              :campaign_id

  def initialize(data)
    @id = data[:id]
    @name = data[:attributes][:name]
    @description = data[:attributes][:description]
    @goal = data[:attributes][:goal]
    @campaign_id = data[:attributes][:campaign_id]
  end
end