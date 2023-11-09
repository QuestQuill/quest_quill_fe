require "rails_helper" 

RSpec.describe "Passwordless Login", type: :feature do
  describe "as a user" do
    describe "when I visit '/login/" do
      it "I should see a form to fill out my email and a button to click to submit" do
        visit "/login"

        within("#passwordless") do
          expect(page).to have_content("Email")
          expect(page).to have_field(:email_passwordless)
          expect(page).to have_button("Get Passwordless Link")
        end
      end

      it "when I fill out the form with a correct email and click the button, I am taken to a page that tell me to check my email and an email is sent" do
        VCR.use_cassette("bob_passwordless_login_dns", :record => :new_episodes) do
          visit login_path

          fill_in :email_passwordless, with: "bobsmith@gmail.com"
          click_button "Get Passwordless Link"

          expect(current_path).to eq(email_login_path)
          expect(page).to have_content("Please check your email for your login link!")

          expect(ActionMailer::Base.deliveries.count).to eq(1)
        end
      end

      it "when I fill out the form with an incorrect email and click the button, I am giving an error message and no email is sent" do
        VCR.use_cassette("wrong_passwordless_login") do
          visit login_path

          fill_in :email_passwordless, with: "wrong_email@gmail.com"
          click_button "Get Passwordless Link"

          expect(current_path).to eq(login_path)
          expect(page).to have_content("This email does not exist in our database, please create a new account.")

          expect(ActionMailer::Base.deliveries.count).to eq(0)
        end
      end

      it "when I click on the link that is generated in the email, I am taken to my user dashboard" do
        VCR.use_cassette("magic_link_test") do
          DndService.new.update_token(1, "abcdefg")

          visit email_login_success_path(token: "abcdefg")

          expect(current_path).to eq(user_path(1))
          expect(page).to have_content("Welcome, DM bobsmith")
        end
      end
    end
  end
end