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
        fill_in :username, with: "bobsmith"
        fill_in :email, with: "bobsmith@gmail.com"
        fill_in :password, with: "1234"

        click_button("Create my account")

        user = User.last

        expect(current_path).to eq("/users/#{user.id}")

        expect(page).to have_content("Welcome, DM #{user.username}")
      end

      it "when I don't fill out the form incorrectly and click 'Create my account' I should be given a message stating it didn't work and still be on the register form" do
        fill_in :username, with: "bobsmith"
        fill_in :password, with: "1234"

        click_button("Create my account")

        expect(page).to have_content("Your account could not be created, please try again.")
        expect(current_path).to eq(new_user_path)
      end
    end
  end
end