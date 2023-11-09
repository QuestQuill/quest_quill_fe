require "rails_helper"

RSpec.describe TownFacade do
  describe "instance methods" do
    describe "#create_town" do
      it "should return a town object that has been created" do
        VCR.use_cassette("DO_NOT_DELETE_create_town_facade_bob") do
          params = {
            user_id: "1",
            campaign_id: "1"
          }

          town = TownFacade.new(nil).create_town(params)

          expect(town).to be_a(Town)
          expect(town.name).to be_a(String)
          expect(town.description).to be_a(String)
          expect(town.leadership).to be_a(String)
          expect(town.shops).to be_a(String)
          expect(town.taverns).to be_a(String)
          expect(town.campaign_id).to be_a(Integer)
        end
      end
    end

    describe "#get_towns" do
      it "returns all towns of a user's campaign" do
        VCR.use_cassette("get_towns_facade") do
          params = {
            user_id: "1",
            campaign_id: "1"
          }

          towns = TownFacade.new(nil).get_towns(params)

          expect(towns).to be_an(Array)
          
          town = towns.first

          expect(town).to be_a(Town)
          expect(town.name).to be_a(String)
          expect(town.description).to be_a(String)
          expect(town.leadership).to be_a(String)
          expect(town.shops).to be_a(String)
          expect(town.taverns).to be_a(String)
          expect(town.campaign_id).to be_a(Integer)
        end
      end
    end
  end
end