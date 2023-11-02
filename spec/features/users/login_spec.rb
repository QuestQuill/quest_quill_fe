require "rails_helper" 

RSpec.describe "Log In Page", type: :feature do
  before(:each) do
    @user = User.create(username: "bob", email: "bob@gmail.com", password: "1234")
    visit login_path
  end
  describe "as a user" do
    describe "when I visit '/login'" do
      describe "I should see a form to enter my email and password and button that says submit" do
        it "when I enter the correct email and password I am redirected to my dashboard" do
          expect(page).to have_content("Log In")

          expect(page).to have_content("Email")
          expect(page).to have_content("Password")
          expect(page).to have_button("Log In")
          
          fill_in :email, with: "bob@gmail.com"
          fill_in :password, with: "1234"
          click_button "Log In"

          expect(current_path).to eq(user_path(@user.id))
          expect(page).to have_content("Welcome, DM #{@user.username}")
        end

        it "I should not be able to go to the dashboard if I do not put in the correct credentials" do
          fill_in :email, with: "bob@gmail.com"
          fill_in :password, with: "5678"
          click_button "Log In"

          expect(current_path).to eq(login_path)
          expect(page).to have_content("Your credentials were incorrect, please try again.")
        end

        it "a logout button should appear on the page once I am logged in" do
          fill_in :email, with: "bob@gmail.com"
          fill_in :password, with: "1234"
          click_button "Log In"

          expect(page).to have_link("Log Out")

          click_link("Log Out")
          expect(current_path).to eq(root_path)
          expect(page).to_not have_link("Log Out")
        end
      end

      it "should redirect back to the dashboard once someone is logged in and tries to go to the landing page" do
        fill_in :email, with: "bob@gmail.com"
        fill_in :password, with: "1234"
        click_button "Log In"

        visit "/"

        user = User.find_by(email: "bob@gmail.com")

        expect(current_path).to eq(user_path(user.id))
      end
    end
  end
end