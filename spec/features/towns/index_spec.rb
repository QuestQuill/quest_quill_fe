require "rails_helper"

RSpec.describe "My Towns Index Page" do
  it "shows a list of all towns" do
    VCR.use_cassette("DO_NOT_DELETE_boo_towns_show") do
      visit login_path

      fill_in :email, with: "boo@gmail.com"
      fill_in :password, with: "12345"
      click_button "Log In"

      click_link "Boo's first campaign"

      click_button "Generate Town"

      expect(page).to have_content("My Towns")
    end
  end
end