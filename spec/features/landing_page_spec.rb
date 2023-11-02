require "rails_helper"

RSpec.describe "Landing Page", type: :feature do
  before(:each) do
    visit "/"
  end
  describe "as a user" do
    describe "when I visit '/'" do
      it "I want to see a message welcoming me to the app" do
        expect(page).to have_content("Welcome to QuestQuill")
      end

      it "I want to see a button to 'Log In' that takes me to '/login'" do
        within("#login") do
          expect(page).to have_link :loginclick

          click_link :loginclick
          expect(current_path).to eq(login_path)
        end
      end

      it "I want to see a button to 'Register' that takes me to '/register'" do
        within ("#register") do
          expect(page).to have_link :registerclick

          click_link :registerclick
          expect(current_path).to eq(new_user_path)
        end
      end
    end
  end
end