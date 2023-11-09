require 'rails_helper'

RSpec.describe "Create a campaign page" do
  describe "create a campaign happy path" do
    it "has a form where I can fill out the details of my campaign" do
      VCR.use_cassette("DO_NOT_DELETE_boo_campaign_create") do
        UserFacade.new(nil).create_user({
          email: "boo@gmail.com",
          username: "boo",
          password: "12345"
        })

        visit login_path

        fill_in :email, with: "boo@gmail.com"
        fill_in :password, with: "12345"
        click_button "Log In"

        click_button "+ New Campaign"

        within(".form-center") do
          expect(page).to have_field "Campaign Name"
          expect(page).to have_field "Number of Players"
          expect(page).to have_content "Campaign Themes"
          expect(page).to have_button "Create my Campaign"

          fill_in "Campaign Name", with: "boo's First Campaign"
          fill_in "Number of Players", with: 4
          check :themes_sci_fi
          check :themes_low_magic
          check :themes_space_opera
          click_button "Create my Campaign"
        end
      end
    end
  end

  describe "sad path, campaign isn't created" do
    it "has a form where I can fill out the details of my campaign, gets error message when not filled out correctly" do
      VCR.use_cassette("DO_NOT_DELETE_boo_campaign_create_fail") do
        UserFacade.new(nil).create_user({
          email: "boo@gmail.com",
          username: "boo",
          password: "12345"
        })

        visit login_path

        fill_in :email, with: "boo@gmail.com"
        fill_in :password, with: "12345"
        click_button "Log In"

        click_button "+ New Campaign"

        within(".form-center") do
          expect(page).to have_field "Campaign Name"
          expect(page).to have_field "Number of Players"
          expect(page).to have_content "Campaign Themes"
          expect(page).to have_button "Create my Campaign"

          fill_in "Number of Players", with: 4
          check :themes_sci_fi
          check :themes_low_magic
          check :themes_space_opera
          click_button "Create my Campaign"
        end

        expect(page).to have_content("Your campaign could not be created, please try again.")
        expect(current_path).to eq(new_user_campaign_path(user_id: 22))
      end
    end
  end
end