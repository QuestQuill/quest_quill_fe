require "rails_helper"

describe DndService do
  describe "instance methods" do
    describe "#get_user" do
      it "returns user data" do
        VCR.use_cassette("get_user_service") do
          user = DndService.new.get_user(1)

          expect(user).to be_a Hash

          expect(user[:data]).to have_key(:id)
          expect(user[:data][:id]).to be_a(String)

          expect(user[:data][:attributes]).to have_key(:username)
          expect(user[:data][:attributes][:username]).to be_a(String)

          expect(user[:data][:attributes]).to have_key(:email)
          expect(user[:data][:attributes][:email]).to be_a(String)

          expect(user[:data][:attributes]).to have_key(:user_photo)
          expect(user[:data][:attributes][:user_photo]).to be_a(Hash)

          expect(user[:data][:attributes]).to have_key(:token)
          expect(user[:data][:attributes][:token]).to eq(nil)

          expect(user[:data][:attributes]).to have_key(:token_expiration)
          expect(user[:data][:attributes][:token_expiration]).to eq(nil)

          expect(user[:data][:attributes]).to have_key(:campaigns)
          expect(user[:data][:attributes][:campaigns]).to be_an(Array)
        end
      end
    end

    describe "#login_authorization" do
      it "returns whether or not login was successful and if so the user id" do
        VCR.use_cassette("login_auth_service") do
          message = DndService.new.login_authorization(email: "bobsmith@gmail.com", password: "1234")

          expect(message).to be_a Hash

          expect(message).to have_key(:message)
          expect(message[:message]).to be_a(String)

          expect(message).to have_key(:user_id)
          expect(message[:user_id]).to be_an(Integer)
        end
      end
    end

    describe "#post_user" do
      it "returns response of creating a user" do
        VCR.use_cassette("DO_NOT_DELETE_post_user_service") do
          user = DndService.new.post_user(email: "ahhhh@gmail.com", username: "AHHHHH", password: "helpme")

          expect(user).to be_a(Hash)

          expect(user[:data]).to have_key(:id)
          expect(user[:data][:id]).to be_a(String)

          expect(user[:data][:attributes]).to have_key(:username)
          expect(user[:data][:attributes][:username]).to be_a(String)

          expect(user[:data][:attributes]).to have_key(:email)
          expect(user[:data][:attributes][:email]).to be_a(String)

          expect(user[:data][:attributes]).to have_key(:user_photo)
          expect(user[:data][:attributes][:user_photo]).to be_a(Hash)

          expect(user[:data][:attributes]).to have_key(:token)
          expect(user[:data][:attributes][:token]).to eq(nil)

          expect(user[:data][:attributes]).to have_key(:token_expiration)
          expect(user[:data][:attributes][:token_expiration]).to eq(nil)

          expect(user[:data][:attributes]).to have_key(:campaigns)
          expect(user[:data][:attributes][:campaigns]).to be_an(Array)
        end
      end
    end

    describe "#search_user" do
      it "returns response of searching for a user by email" do
        VCR.use_cassette("service_user_search_email") do
          user = DndService.new.search_user(email: "rhys@acotar.com")

          expect(user).to be_a(Hash)

          expect(user[:data].first).to have_key(:id)
          expect(user[:data].first[:id]).to be_a(String)

          expect(user[:data].first[:attributes]).to have_key(:username)
          expect(user[:data].first[:attributes][:username]).to be_a(String)

          expect(user[:data].first[:attributes]).to have_key(:email)
          expect(user[:data].first[:attributes][:email]).to be_a(String)

          expect(user[:data].first[:attributes]).to have_key(:user_photo)
          expect(user[:data].first[:attributes][:user_photo]).to be_a(Hash)

          expect(user[:data].first[:attributes]).to have_key(:token)
          expect(user[:data].first[:attributes][:token]).to be_a(String)

          expect(user[:data].first[:attributes]).to have_key(:token_expiration)
          expect(user[:data].first[:attributes][:token_expiration]).to be_a(String)

          expect(user[:data].first[:attributes]).to have_key(:campaigns)
          expect(user[:data].first[:attributes][:campaigns]).to be_an(Array)
        end
      end

      it "returns response of searching for a user by token" do
        VCR.use_cassette("service_user_search_token") do
          user = DndService.new.search_user(token: "abcdefgh")

          expect(user).to be_a(Hash)

          expect(user[:data].first).to have_key(:id)
          expect(user[:data].first[:id]).to be_a(String)

          expect(user[:data].first[:attributes]).to have_key(:username)
          expect(user[:data].first[:attributes][:username]).to be_a(String)

          expect(user[:data].first[:attributes]).to have_key(:email)
          expect(user[:data].first[:attributes][:email]).to be_a(String)

          expect(user[:data].first[:attributes]).to have_key(:user_photo)
          expect(user[:data].first[:attributes][:user_photo]).to be_a(Hash)

          expect(user[:data].first[:attributes]).to have_key(:token)
          expect(user[:data].first[:attributes][:token]).to be_a(String)

          expect(user[:data].first[:attributes]).to have_key(:token_expiration)
          expect(user[:data].first[:attributes][:token_expiration]).to be_a(String)

          expect(user[:data].first[:attributes]).to have_key(:campaigns)
          expect(user[:data].first[:attributes][:campaigns]).to be_an(Array)
        end
      end

      it "returns nil if response.status isn't 200" do
        VCR.use_cassette("nil_search_response_service") do
          user = DndService.new.search_user(token: "1234")

          expect(user).to eq(nil)
        end
      end
    end

    describe "#update_token" do
      it "returns user with updated token" do
        VCR.use_cassette("update_token_service") do
          user = DndService.new.update_token(14, "123456")

          expect(user).to be_a(Hash)

          expect(user[:data]).to have_key(:id)
          expect(user[:data][:id]).to be_a(String)

          expect(user[:data][:attributes]).to have_key(:username)
          expect(user[:data][:attributes][:username]).to be_a(String)

          expect(user[:data][:attributes]).to have_key(:email)
          expect(user[:data][:attributes][:email]).to be_a(String)

          expect(user[:data][:attributes]).to have_key(:user_photo)
          expect(user[:data][:attributes][:user_photo]).to be_a(Hash)

          expect(user[:data][:attributes]).to have_key(:token)
          expect(user[:data][:attributes][:token]).to be_a(String)

          expect(user[:data][:attributes]).to have_key(:token_expiration)
          expect(user[:data][:attributes][:token_expiration]).to be_a(String)

          expect(user[:data][:attributes]).to have_key(:campaigns)
          expect(user[:data][:attributes][:campaigns]).to be_an(Array)
        end
      end
    end

    describe "#github_auth" do
      it "returns user from github login" do
        VCR.use_cassette("github_auth_service") do
          user = DndService.new.github_auth({
            login: "elizakeating",
            uid: "134974541",
            access_token: "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"
          }
          )

          expect(user).to be_a(Hash)

          expect(user[:data]).to have_key(:id)
          expect(user[:data][:id]).to be_a(String)

          expect(user[:data][:attributes]).to have_key(:uid)
          expect(user[:data][:attributes][:uid]).to be_a(String)

          expect(user[:data][:attributes]).to have_key(:username)
          expect(user[:data][:attributes][:username]).to be_a(String)

          expect(user[:data][:attributes]).to have_key(:email)
          expect(user[:data][:attributes][:email]).to be_a(String)

          expect(user[:data][:attributes]).to have_key(:user_photo)
          expect(user[:data][:attributes][:user_photo]).to be_a(Hash)

          expect(user[:data][:attributes]).to have_key(:token)
          expect(user[:data][:attributes][:token]).to eq(nil)

          expect(user[:data][:attributes]).to have_key(:token_expiration)
          expect(user[:data][:attributes][:token_expiration]).to eq(nil)

          expect(user[:data][:attributes]).to have_key(:auth_token)
          expect(user[:data][:attributes][:auth_token]).to be_a(String)

          expect(user[:data][:attributes]).to have_key(:campaigns)
          expect(user[:data][:attributes][:campaigns]).to be_an(Array)
        end
      end
    end

    describe "#post_campaign" do
      it "returns response of creating a campaign" do 
        VCR.use_cassette("DO_NOT_DELETE_post_campaign_service") do
          campaign = DndService.new.post_campaign(name: "ACOTAR", player_num: 7, themes: ["high_magic", "space_opera"], user_id: 22)

          expect(campaign).to be_a(Hash)

          expect(campaign[:data]).to have_key(:id)
          expect(campaign[:data][:id]).to be_a(String)
          
          expect(campaign[:data][:attributes]).to have_key(:name)
          expect(campaign[:data][:attributes][:name]).to be_a(String)

          expect(campaign[:data][:attributes]).to have_key(:player_num)
          expect(campaign[:data][:attributes][:player_num]).to be_an(Integer)

          expect(campaign[:data][:attributes]).to have_key(:themes)
          expect(campaign[:data][:attributes][:themes]).to be_an(String)

          expect(campaign[:data][:attributes]).to have_key(:user_id)
          expect(campaign[:data][:attributes][:user_id]).to be_an(Integer)
        end
      end
    end

    describe "#get_campaign" do
      it "returns campaign data" do
        VCR.use_cassette("get_campaign_service") do
          campaign = DndService.new.get_campaign({user_id: 22, campaign_id: 4})

          expect(campaign).to be_a(Hash)

          expect(campaign[:data][0]).to have_key(:id)
          expect(campaign[:data][0][:id]).to be_a(String)
          
          expect(campaign[:data][0][:attributes]).to have_key(:name)
          expect(campaign[:data][0][:attributes][:name]).to be_a(String)

          expect(campaign[:data][0][:attributes]).to have_key(:player_num)
          expect(campaign[:data][0][:attributes][:player_num]).to be_an(Integer)

          expect(campaign[:data][0][:attributes]).to have_key(:themes)
          expect(campaign[:data][0][:attributes][:themes]).to be_an(String)

          expect(campaign[:data][0][:attributes]).to have_key(:user_id)
          expect(campaign[:data][0][:attributes][:user_id]).to be_an(Integer)
        end
      end
    end

    describe "#post_npc" do 
      it "returns successful response of creating a NPC" do
        VCR.use_cassette("DO_NOT_DELETE_post_NPC_service") do
          npc = DndService.new.post_npc({user_id: "22", campaign_id: "4"})

          expect(npc).to be_a(Hash)

          expect(npc[:data]).to have_key(:id)
          expect(npc[:data][:id]).to be_a(String)
          
          expect(npc[:data][:attributes]).to have_key(:name)
          expect(npc[:data][:attributes][:name]).to be_a(String)

          expect(npc[:data][:attributes]).to have_key(:description)
          expect(npc[:data][:attributes][:description]).to be_an(String)

          expect(npc[:data][:attributes]).to have_key(:gender)
          expect(npc[:data][:attributes][:gender]).to be_an(String)
          
          expect(npc[:data][:attributes]).to have_key(:race)
          expect(npc[:data][:attributes][:race]).to be_an(String)
          
          expect(npc[:data][:attributes]).to have_key(:klass)
          expect(npc[:data][:attributes][:klass]).to be_an(String)
          
          expect(npc[:data][:attributes]).to have_key(:attitude)
          expect(npc[:data][:attributes][:attitude]).to be_an(String)

          expect(npc[:data][:attributes]).to have_key(:campaign_id)
          expect(npc[:data][:attributes][:campaign_id]).to be_an(Integer)
        end
      end
    end

    describe "#get_npcs" do
      it "returns a list of NPCs" do
        VCR.use_cassette("get_NPCs_service") do
          params = {
            user_id: "22",
            campaign_id: "4"
          }

          npcs = DndService.new.get_npcs(params)

          expect(npcs[:data]).to be_an(Array)

          npc = npcs[:data].first

          expect(npc).to be_a(Hash)

          expect(npc).to have_key(:id)
          expect(npc[:id]).to be_a(String)

          expect(npc[:attributes]).to have_key(:name)
          expect(npc[:attributes][:name]).to be_a(String)

          expect(npc[:attributes]).to have_key(:description)
          expect(npc[:attributes][:description]).to be_an(String)

          expect(npc[:attributes]).to have_key(:gender)
          expect(npc[:attributes][:gender]).to be_an(String)

          expect(npc[:attributes]).to have_key(:race)
          expect(npc[:attributes][:race]).to be_an(String)

          expect(npc[:attributes]).to have_key(:klass)
          expect(npc[:attributes][:klass]).to be_an(String)

          expect(npc[:attributes]).to have_key(:attitude)
          expect(npc[:attributes][:attitude]).to be_an(String)

          expect(npc[:attributes]).to have_key(:campaign_id)
          expect(npc[:attributes][:campaign_id]).to be_an(Integer)
        end
      end
    end

    describe "#post_quest" do
      it "returns response of successfully creating a quest" do
        VCR.use_cassette("post_quest_service") do
          params = {
            user_id: "22",
            campaign_id: "4"
          }

          quest = DndService.new.post_quest(params)

          expect(quest).to be_a(Hash)

          expect(quest[:data]).to have_key(:id)
          expect(quest[:data][:id]).to be_a(String)

          expect(quest[:data][:attributes]).to have_key(:name)
          expect(quest[:data][:attributes][:name]).to be_a(String)

          expect(quest[:data][:attributes]).to have_key(:description)
          expect(quest[:data][:attributes][:description]).to be_an(String)

          expect(quest[:data][:attributes]).to have_key(:goal)
          expect(quest[:data][:attributes][:goal]).to be_an(String)
        end
      end
    end

    describe "#get_quests" do
      it "returns a list of quests" do
        VCR.use_cassette("get_quests_index_service") do
          params = {
            user_id: "22",
            campaign_id: "4"
          }

          quests = DndService.new.get_quests(params)

          expect(quests[:data]).to be_an(Array)

          quest = quests[:data].first

          expect(quest).to be_a(Hash)

          expect(quest).to have_key(:id)
          expect(quest[:id]).to be_a(String)

          expect(quest[:attributes]).to have_key(:name)
          expect(quest[:attributes][:name]).to be_a(String)

          expect(quest[:attributes]).to have_key(:description)
          expect(quest[:attributes][:description]).to be_an(String)

          expect(quest[:attributes]).to have_key(:goal)
          expect(quest[:attributes][:goal]).to be_an(String)
        end
      end
    end

    describe "#post_town" do
      it "returns response of successfully creating a town" do
        VCR.use_cassette("post_town_service") do
          params = {
            user_id: "22",
            campaign_id: "4"
          }

          town = DndService.new.post_town(params)

          expect(town).to be_a(Hash)

          expect(town[:data]).to have_key(:id)
          expect(town[:data][:id]).to be_a(String)

          expect(town[:data][:attributes]).to have_key(:name)
          expect(town[:data][:attributes][:name]).to be_a(String)

          expect(town[:data][:attributes]).to have_key(:description)
          expect(town[:data][:attributes][:description]).to be_an(String)

          expect(town[:data][:attributes]).to have_key(:leadership)
          expect(town[:data][:attributes][:leadership]).to be_an(String)
          
          expect(town[:data][:attributes]).to have_key(:shops)
          expect(town[:data][:attributes][:shops]).to be_an(String)
          
          expect(town[:data][:attributes]).to have_key(:taverns)
          expect(town[:data][:attributes][:taverns]).to be_an(String)
          
          expect(town[:data][:attributes]).to have_key(:campaign_id)
          expect(town[:data][:attributes][:campaign_id]).to be_an(Integer)
        end
      end
    end

    describe "#get_towns" do
      it "returns a list of towns" do
        VCR.use_cassette("get_towns_index_service") do
          params = {
            user_id: "22",
            campaign_id: "4"
          }
          
          towns = DndService.new.get_towns(params)

          expect(towns[:data]).to be_an(Array)

          town = towns[:data].first

          expect(town).to be_a(Hash)

          expect(town).to have_key(:id)
          expect(town[:id]).to be_a(String)

          expect(town[:attributes]).to have_key(:name)
          expect(town[:attributes][:name]).to be_a(String)

          expect(town[:attributes]).to have_key(:description)
          expect(town[:attributes][:description]).to be_an(String)

          expect(town[:attributes]).to have_key(:leadership)
          expect(town[:attributes][:leadership]).to be_an(String)
          
          expect(town[:attributes]).to have_key(:shops)
          expect(town[:attributes][:shops]).to be_an(String)
          
          expect(town[:attributes]).to have_key(:taverns)
          expect(town[:attributes][:taverns]).to be_an(String)
          
          expect(town[:attributes]).to have_key(:campaign_id)
          expect(town[:attributes][:campaign_id]).to be_an(Integer)
        end
      end
    end
  end
end