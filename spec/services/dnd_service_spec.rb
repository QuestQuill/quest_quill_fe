require "rails_helper"

describe DndService do
  describe "instance methods" do
    describe "#get_user" do
      it "returns user data" do
        VCR.use_cassette("get_user_service") do
          user = DndService.new.get_user(1)

          expect(user).to be_a Hash

          expect(user).to have_key(:id)
          expect(user[:id]).to be_an(Integer)

          expect(user).to have_key(:username)
          expect(user[:username]).to be_a(String)

          expect(user).to have_key(:email)
          expect(user[:email]).to be_a(String)

          expect(user).to have_key(:password_digest)
          expect(user[:password_digest]).to be_a(String)
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
          user = DndService.new.post_user(email: "scooby@doo.com", username: "scoobydoo", password: "ruhroh")

          expect(user).to be_a(Hash)

          expect(user).to have_key(:id)
          expect(user[:id]).to be_an(Integer)

          expect(user).to have_key(:username)
          expect(user[:username]).to be_a(String)

          expect(user).to have_key(:email)
          expect(user[:email]).to be_a(String)

          expect(user).to have_key(:password_digest)
          expect(user[:password_digest]).to be_a(String)
        end
      end
    end
  end
end