require 'rails_helper'

RSpec.describe "User Dashboard/ show page" do
  before(:each) do
    @user_1 = User.create!(username: "Finn", email: "finn@ooo.com", password: "jake")
    @user_2 = User.create!(username: "Jake", email: "jake@ooo.com", password: "finn")

    visit user_path(@user_1)
  end

  it "the page shows the app name, and welcome's the DM by username" do
    within(".navbar") do
      expect(page).to have_link("QuestQuill")
    end

    within(".user-welcome") do
      expect(page).to have_content("Welcome, DM Finn")
      expect(page).to_not have_content("Welcome, DM Jake")
    end
  end

  it "should list out the campaigns for the user dashboard" do
    
  end
end