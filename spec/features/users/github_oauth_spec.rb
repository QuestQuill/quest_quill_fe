require "rails_helper"

RSpec.describe "Github Oauth", type: :feature do
  describe "as a user" do
    describe "when I visit '/login'" do
      VCR.use_cassette("github login") do
        it "I should see a button to log in with Github" do
          visit login_path

          expect(page).to have_link("Github Login")
        end
      end
    end
  end
end