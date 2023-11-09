class Npc
  attr_reader :id,
              :name,
              :description,
              :gender,
              :race,
              :klass,
              :attitude,
              :campaign_id

  def initialize(data)
    @id = data[:id]
    @name = data[:attributes][:name]
    @description = data[:attributes][:description]
    @gender = data[:attributes][:gender]
    @race = data[:attributes][:race]
    @klass = data[:attributes][:klass]
    @attitude = data[:attributes][:attitude]
    @campaign_id = data[:attributes][:campaign_id]
  end
end