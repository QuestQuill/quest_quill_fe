require 'rails_helper'

RSpec.describe "Create a campaign page" do
  describe "create a campaign happy path" do
    it "has a form where I can fill out the details of my campaign" do
      VCR.use_cassette("DO_NOT_DELETE_finn_campaign_create") do
        UserFacade.new(nil).create_user({
          email: "finn@gmail.com",
          username: "FinnTheHuman",
          password: "12345"
        })

        visit login_path

        fill_in :email, with: "finn@gmail.com"
        fill_in :password, with: "12345"
        click_button "Log In"

        click_button "+ New Campaign"

        within(".form-center") do
          expect(page).to have_field "Campaign Name"
          expect(page).to have_field "Number of Players"
          expect(page).to have_content "Campaign Themes"
          expect(page).to have_button "Create my Campaign"

          fill_in "Campaign Name", with: "Baby's First Campaign"
          fill_in "Number of Players", with: 5
          check :themes_fantasy
          check :themes_gods_and_monsters
          check :themes_high_magic
          click_button "Create my Campaign"
        end
      end
    end
  end
end