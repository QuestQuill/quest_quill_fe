require "rails_helper"

RSpec.describe "New User", type: :feature do
  before(:each) do
    visit "/users/new"
  end
  describe "as a user" do
    describe "when I visit '/users/new'" do
      it "I should see a form to fill out my username, email, password, and a button to 'Create my account'" do
        expect(page).to have_content "Create an Account"

        expect(page).to have_content("Username")
        expect(page).to have_content("Email")
        expect(page).to have_content("Password")
        expect(page).to have_button("Create my account")
      end

      it "when I fill out my information correctly and click 'Create my account' I should be taken to my user dashboard" do
        VCR.use_cassette("DO_NOT_DELETE_user_create_jill") do
          fill_in :username, with: "jill"
          fill_in :email, with: "jill@gmail.com"
          fill_in :password, with: "1234"

          click_button("Create my account")

          expect(page).to have_content("Welcome, DM jill")
        end
      end

      it "when I don't fill out the form incorrectly and click 'Create my account' I should be given a message stating it didn't work and still be on the register form" do
        VCR.use_cassette("DO_NOT_DELETE_user_create_jill_sad_path") do
          fill_in :username, with: "jill"
          fill_in :password, with: "1234"

          click_button("Create my account")

          expect(page).to have_content("Your account could not be created, please try again.")
          expect(current_path).to eq(new_user_path)
        end
      end
    end
  end
end