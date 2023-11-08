require 'rails_helper'

RSpec.describe "Campaign show page" do
  it "should have a link to the generators" do
    VCR.use_cassette("DO_NOT_DELETE_boo_campaign_show") do

      visit login_path

      fill_in :email, with: "boo@gmail.com"
      fill_in :password, with: "12345"
      click_button "Log In"

      click_link "Boo's first campaign"

      expect(page).to have_content("Boo's first campaign")
      expect(page).to have_link("Generate Town")
      expect(page).to have_link("Generate NPC") 
    end
  end
end