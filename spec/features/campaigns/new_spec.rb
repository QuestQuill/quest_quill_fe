require 'rails_helper'

RSpec.describe "Create a campaign page" do
  before(:each) do
    @user_1 = User.create!(username: "Finn", email: "finn@ooo.com", password: "jake")
    @user_2 = User.create!(username: "Jake", email: "jake@ooo.com", password: "finn")
  end
end