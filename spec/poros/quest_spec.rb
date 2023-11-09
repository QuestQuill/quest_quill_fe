require "rails_helper"

RSpec.describe Quest do
  describe "#initialize" do
    it "creates a quest object" do
      quest_data = {
        id: "2",
        attributes: {
          name: "A quest",
          description: "On this quest you do things",
          goal: "to do things",
          campaign_id: "1"
        }
      }

      quest = Quest.new(quest_data)

      expect(quest.id).to eq(quest_data[:id])
      expect(quest.name).to eq(quest_data[:attributes][:name])
      expect(quest.description).to eq(quest_data[:attributes][:description])
      expect(quest.goal).to eq(quest_data[:attributes][:goal])
      expect(quest.campaign_id).to eq(quest_data[:attributes][:campaign_id])
    end
  end
end