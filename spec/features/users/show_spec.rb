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

  it "has a log out link and a button to create a new campaign in the nav bar when logged in" do
    visit root_path

    click_link "registerclick"

    fill_in :username, with: "User 1"
    fill_in :email, with: "email1@test.com"
    fill_in :password, with: "password1"
    click_button "Create my account"

    user = User.last

    expect(current_path).to eq("/users/#{user.id}")


    within(".navbar") do
      expect(page).to have_link "Log Out"
      expect(page).to have_button "+ New Campaign"

      click_button "+ New Campaign"

      expect(current_path).to eq("/users/#{user.id}/campaigns/new")
    end
  end

  xit "should list out the campaigns for the user dashboard" do # Should I include a message for no campaigns? 
    # campaign_params: {
    #   name: "Campaign 1",
    #   player_num: 5, 
    #   themes: "spooky",
    #   user_id: @user_1.id
    #   }
    # stub_request(:post, "https://quest-quill-api.onrender.com/api/v1/users/#{@user_1.id}/campaigns").
    #   with(body: campaign_params)



  end
end