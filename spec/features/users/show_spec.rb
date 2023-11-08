require 'rails_helper'

RSpec.describe "User Dashboard/ show page" do
  it "the page shows the app name, and welcome's the DM by username" do
    VCR.use_cassette("DO_NOT_DELETE_user_show_rick") do
      visit login_path

      fill_in :email, with: "rick@gmail.com"
      fill_in :password, with: "1234"
      click_button "Log In"

      within(".navbar") do
        expect(page).to have_link("QuestQuill")
      end
  
      within(".user-welcome") do
        expect(page).to have_content("Welcome, DM rick")
        expect(page).to_not have_content("Welcome, DM Jake")
      end
    end
  end

  it "has a log out link and a button to create a new campaign in the nav bar when logged in" do
   VCR.use_cassette("DO_NOT_DELETE_user_show_rick") do 
      visit login_path

      fill_in :email, with: "rick@gmail.com"
      fill_in :password, with: "1234"
      click_button "Log In"

      within(".navbar") do
        expect(page).to have_link "Log Out"
      end
      
      within(".user-welcome") do
        expect(page).to have_button "+ New Campaign"
  
        click_button "+ New Campaign"
      end

      expect(page).to have_field("Campaign Name")
      expect(page).to have_field("Number of Players")
   end
  end

  it "should list out the campaigns for the user dashboard" do 
    VCR.use_cassette("DO_NOT_DELETE_user_show_boo") do 
      visit login_path

      fill_in :email, with: "boo@gmail.com"
      fill_in :password, with: "12345"
      click_button "Log In"

      within(".navbar") do
        expect(page).to have_link "Log Out"
      end

      within(".user-welcome") do
        expect(page).to have_button "+ New Campaign"
      end
    
      expect(page).to have_content("Welcome, DM boo")

      within(".user_campaigns") do
        expect(page).to have_content("Campaign Name")
        expect(page).to have_content("Number of Players")
        expect(page).to have_content("Themes")
        expect(page).to have_content("Boo's first campaign")
        expect(page).to have_content(4)
        expect(page).to have_content(["sci_fi", "low_magic", "space_opera"])
      end
   end
  end
end