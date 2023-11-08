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
  end
end