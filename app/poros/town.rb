class Town
  attr_reader :id,
              :name, 
              :description, 
              :leadership, 
              :shops, 
              :taverns,
              :campaign_id

   def initialize(data)
    @id = data[:id]
    @name = data[:attributes][:name]
    @description = data[:attributes][:description]
    @leadership = data[:attributes][:leadership]
    @shops = data[:attributes][:shops]
    @taverns = data[:attributes][:taverns]
    @campaign_id = data[:attributes][:campaign_id]
   end
end