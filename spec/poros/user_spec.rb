require "rails_helper"

RSpec.describe User do
  describe "initialize" do
    it "creates a user object" do
      VCR.use_cassette("DO_NOT_DELETE_create_user_waterbottle_poro") do
        user_data = {
          username: "waterbottle",
          email: "waterbottle@gmail.com",
          password: "water"
        }

        user = UserFacade.new(nil).create_user(user_data)

        expect(user).to be_a(User)
        expect(user.id).to eq(user.id)
        expect(user.username).to eq("waterbottle")
        expect(user.email).to eq("waterbottle@gmail.com")
      end
    end
  end
end