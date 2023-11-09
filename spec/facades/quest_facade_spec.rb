require "rails_helper"

RSpec.describe QuestFacade do
  describe "instance methods" do
    describe "#create_quest" do
      it "returns a quest object that has been created" do
        VCR.use_cassette("DO_NOT_DELETE_quest_facade_create_bob") do
          params = {
            user_id: "1",
            campaign_id: "1"
          }

          quest = QuestFacade.new(nil).create_quest(params)

          expect(quest).to be_a(Quest)
          expect(quest.id).to be_a(String)
          expect(quest.name).to be_a(String)
          expect(quest.description).to be_a(String)
          expect(quest.campaign_id).to be_an(Integer)
        end
      end
    end

    describe "#get_quests" do
      it "returns all quest objects of a user's campaign" do
        VCR.use_cassette("get_quests_bob_facade") do
          params = {
            user_id: "1",
            campaign_id: "1"
          }

          quests = QuestFacade.new(nil).get_quests(params)

          expect(quests).to be_an(Array)

          quest = quests.first

          expect(quest).to be_a(Quest)
          expect(quest.id).to be_a(String)
          expect(quest.name).to be_a(String)
          expect(quest.description).to be_a(String)
          expect(quest.campaign_id).to be_an(Integer)
        end
      end
    end
  end
end