require "rails_helper"

RSpec.describe User do
  describe "initialize" do
    it "creates a user object" do
      user_data = {
        id: 1,
        username: "bobsmith",
        email: "bob@gmail.com"
      }

      user = User.new(user_data)

      expect(user).to be_a(User)
      expect(user.id).to eq(1)
      expect(user.username).to eq("bobsmith")
      expect(user.email).to eq("bob@gmail.com")
    end
  end
end