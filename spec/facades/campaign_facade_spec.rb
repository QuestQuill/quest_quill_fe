require "rails_helper"

RSpec.describe CampaignFacade do
  describe "instance methods" do
    describe "#create_campaign" do
      it "should return a created campaign object" do
        VCR.use_cassette("DO_NOT_DELETE_bob_create_quest") do
          params = {
            user_id: "1",
            name: "A cool campaign",
            player_num: 3,
            themes: ["spooky", "high_magic"]
          }

          campaign = CampaignFacade.new(nil).create_campaign(params)

          expect(campaign).to be_a(Campaign)
          expect(campaign.id).to be_a(String)
          expect(campaign.name).to be_a(String)
          expect(campaign.player_num).to be_an(Integer)
          expect(campaign.themes).to be_a(String)
        end
      end
    end

    describe "#campaign" do
      it "should return a specific campaign user" do
        VCR.use_cassette("return_campaign_facade") do
          params = {
            user_id: "1",
            id: "1"
          }

          campaign = CampaignFacade.new(nil).campaign(params)

          expect(campaign).to be_a(Campaign)
          expect(campaign.id).to be_a(String)
          expect(campaign.name).to be_a(String)
          expect(campaign.player_num).to be_an(Integer)
          expect(campaign.themes).to be_a(String)
        end
      end
    end
  end
end