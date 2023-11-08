require 'rails_helper'

RSpec.describe "Campaign show page" do
  it "should have a link to the generators" do
    VCR.use_cassette("DO_NOT_DELETE_mor_campaign_create") do
      UserFacade.new(nil).create_user({
        username: "mor",
        email: "mor@test.com",
        password: "12345"
      })

      visit login_path

      fill_in :email, with: "mor@test.com"
      fill_in :password, with: "12345"
      click_button "Log In"

      click_button "+ New Campaign"

      fill_in "Campaign Name", with: "mor's First Campaign"
      fill_in "Number of Players", with: 4
      check :themes_fantasy
      check :themes_gods_and_monsters
      check :themes_high_magic
      click_button "Create my Campaign"

      expect(page).to have_link "Mor's first campaign"
    end
     
  end
end