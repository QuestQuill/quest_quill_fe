require 'rails_helper'

RSpec.describe "Create a campaign page" do
  describe "create a campaign happy path" do
    it "has a form where I can fill out the details of my campaign" do
      VCR.use_cassette("DO_NOT_DELETE_user_campaign_create_john") do
        visit login_path

        fill_in :email, with: "john@gmail.com"
        fill_in :password, with: "1234"
        click_button "Log In"

        click_button "+ New Campaign"

        within(".form-center") do
          expect(page).to have_field "Campaign Name"
          expect(page).to have_field "Number of Players"
          expect(page).to have_field "Campaign Themes"
          expect(page).to have_button "Create my Campaign"

          fill_in "Campaign Name", with: "Baby's First Campaign"
          fill_in "Number of Players", with: 5
          fill_in ""
        end

      end
    end
  end
end