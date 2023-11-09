require "rails_helper"

RSpec.describe Town do
  describe "#initialize" do
    it "creates a town object" do
      town_data = {
        id: "1",
        attributes: {
          name: "The Night Court",
          description: "The court of night",
          leadership: "Rhys and Feyre",
          shops: "Rainbow of Velaris",
          taverns: "Sevenda's Place",
          campaign_id: "1"
        }
      }

      town = Town.new(town_data)

      expect(town.id).to eq(town_data[:id])
      expect(town.name).to eq(town_data[:attributes][:name])
      expect(town.description).to eq(town_data[:attributes][:description])
      expect(town.leadership).to eq(town_data[:attributes][:leadership])
      expect(town.shops).to eq(town_data[:attributes][:shops])
      expect(town.taverns).to eq(town_data[:attributes][:taverns])
      expect(town.campaign_id).to eq(town_data[:attributes][:campaign_id])
    end
  end
end