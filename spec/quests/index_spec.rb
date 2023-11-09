require "rails_helper"

RSpec.describe "My Quests Index Page" do
  it "shows a list of all Quests" do
    VCR.user_cassette("DO_NOT_DELETE_boo_Quests_show") do
      visit login_path

      fill_in :email, with: "boo@gmail.com"
      fill_in :password, with: "12345"
      click_button "Log In"

      click_link "Boo's first campaign"

      click_button "Generate Quest"

      expect(page).to have_content("My Quests")
    end
  end
end