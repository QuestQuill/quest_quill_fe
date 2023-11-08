require "rails_helper"

RSpec.describe User do
  describe "initialize" do
    it "creates a user object" do
      user_data = {
        id: "5",
        attributes: {
          uid: "987923",
          username: "plate",
          email: "plate@gmail.com",
          token: "2kdhfal",
          token_expiration: "DHFKASDHF",
          auth_token: "hdks2974",
          campaigns: ["campaign 1", "campaign 2"]
        }
      }

      user = User.new(user_data)

      expect(user).to be_a(User)
      expect(user.id).to eq(user_data[:id])
      expect(user.uid).to eq(user_data[:attributes][:uid])
      expect(user.username).to eq(user_data[:attributes][:username])
      expect(user.email).to eq(user_data[:attributes][:email])
      expect(user.token).to eq(user_data[:attributes][:token])
      expect(user.token_expiration).to eq(user_data[:attributes][:token_expiration])
      expect(user.auth_token).to eq(user_data[:attributes][:auth_token])
      expect(user.campaigns).to eq(user_data[:attributes][:campaigns])
    end
  end
end