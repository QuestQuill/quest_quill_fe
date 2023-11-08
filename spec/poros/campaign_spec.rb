require 'rails_helper'

RSpec.describe Campaign do
  describe "initialize" do
    it "creates a campaign object" do
      VCR.use_cassette("DO_NOT_DELETE_create_new_campaign_boo_poro") do
        campaign_data = {
          name: "sadclub",
          player_num: 7,
          themes: ["high_magic", "space_opera"],
          user_id: 22
        }

        campaign = CampaignFacade.new(nil).create_campaign(campaign_data)

        expect(campaign).to be_a Campaign
        expect(campaign.name).to eq("sadclub")
        expect(campaign.player_num).to eq(7)
        expect(campaign.themes).to eq("[\"high_magic\", \"space_opera\"]")
        expect(campaign.user_id).to eq(22)
      end
    end
  end
end