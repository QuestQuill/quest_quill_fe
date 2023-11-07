require 'rails_helper'

RSpec.describe "User Dashboard/ show page" do
  it "the page shows the app name, and welcome's the DM by username" do
    VCR.use_cassette("DO_NOT_DELETE_user_show_john") do
      visit login_path

      fill_in :email, with: "john@gmail.com"
      fill_in :password, with: "1234"
      click_button "Log In"

      within(".navbar") do
        expect(page).to have_link("QuestQuill")
      end
  
      within(".user-welcome") do
        expect(page).to have_content("Welcome, DM john")
        expect(page).to_not have_content("Welcome, DM Jake")
      end
    end
  end

  it "has a log out link and a button to create a new campaign in the nav bar when logged in" do
   VCR.use_cassette("DO_NOT_DELETE_user_show_john") do 
      visit login_path

      fill_in :email, with: "john@gmail.com"
      fill_in :password, with: "1234"
      click_button "Log In"

      within(".navbar") do
        expect(page).to have_link "Log Out"
        expect(page).to have_button "+ New Campaign"

        click_button "+ New Campaign"
      end
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