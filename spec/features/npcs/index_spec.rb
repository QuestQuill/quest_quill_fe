require "rails_helper"

RSpec.describe "My NPCs Index Page" do
  it "shows a list of all NPCs" do
    VCR.use_cassette("DO_NOT_DELETE_boo_NPCs_show") do
      visit login_path

      fill_in :email, with: "boo@gmail.com"
      fill_in :password, with: "12345"
      click_button "Log In"

      click_link "Boo's first campaign"

      click_button "Generate NPC"

      expect(page).to have_content("My NPCs")
    end
  end
end