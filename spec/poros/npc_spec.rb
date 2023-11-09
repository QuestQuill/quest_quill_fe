require "rails_helper"

RSpec.describe Npc do
  describe "#initialize" do
    it "creates a npc object" do
      npc_data = {
        id: "2",
        attributes: {
          name: "Feyre",
          description: "High Lady of the Night Court",
          gender: "Female",
          race: "High fae",
          klass: "All the magic",
          attitude: "Slay",
          campaign_id: "1"
        }
      }

      npc = Npc.new(npc_data)

      expect(npc.id).to eq(npc_data[:id])
      expect(npc.name).to eq(npc_data[:attributes][:name])
      expect(npc.description).to eq(npc_data[:attributes][:description])
      expect(npc.gender).to eq(npc_data[:attributes][:gender])
      expect(npc.race).to eq(npc_data[:attributes][:race])
      expect(npc.klass).to eq(npc_data[:attributes][:klass])
      expect(npc.attitude).to eq(npc_data[:attributes][:attitude])
      expect(npc.campaign_id).to eq(npc_data[:attributes][:campaign_id])
    end
  end
end