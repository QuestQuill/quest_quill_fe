require "rails_helper"

RSpec.describe UserFacade do
  before :each do
    @facade = UserFacade.new(13)
  end

  describe "instance methods" do
    describe "#login_user" do
      it "returns user id of logged in person" do
        VCR.use_cassette("DO_NOT_DELETE_user_login_rick_facade") do
          expect(@facade.login_user(email: "rick@gmail.com", password: "1234")).to be_an(Integer)
        end
      end
    end

    describe "#user" do
      it "returns a user object" do
        VCR.use_cassette("DO_NOT_DELETE_user_show_rick") do
          user = @facade.user
          
          expect(user).to be_a(User)
          expect(user.email).to be_a(String)
          expect(user.id).to be_an(String)
          expect(user.username).to be_a(String)
        end
      end
    end

    describe "#create_user" do
      it "returns a new user if created successfully" do
        VCR.use_cassette("DO_NOT_DELETE_rhys_create_facade") do
          user = @facade.create_user({
            username: "rhys",
            email: "rhys@acotar.com",
            password: "feyre"
          })
          

          expect(user).to be_a(User)
          expect(user.id).to be_an(String)
          expect(user.email).to be_a(String)
          expect(user.username).to be_a(String)
        end
      end
    end

    describe "#search_user" do
      it "returns a user based on search by email" do
        VCR.use_cassette("DO_NOT_DELETE_user_search_email_rhys") do
          user = @facade.search_user(email: "rhys@acotar.com")

          expect(user).to be_a(User)
          expect(user.id).to be_an(String)
          expect(user.email).to be_a(String)
          expect(user.username).to be_a(String)
        end
      end

      it "returns a user based on search by token" do
        VCR.use_cassette("DO_NOT_DELETE_user_search_token_rhys") do
          @facade.update_token(@facade.search_user(email: "rhys@acotar.com"), "abcdefgh")
          user = @facade.search_user(token: "abcdefgh")

          expect(user).to be_a(User)
          expect(user.id).to be_an(String)
          expect(user.email).to be_a(String)
          expect(user.username).to be_a(String)
        end
      end
    end

    describe "#update_token" do
      it "updates a user's token" do
        VCR.use_cassette("DO_NOT_DELETE_user_update_token_rhys") do
          user = @facade.update_token(@facade.search_user(email: "rhys@acotar.com"), "abcdefgh")

          expect(user).to be_a(User)
          expect(user.id).to be_an(String)
          expect(user.email).to be_a(String)
          expect(user.username).to be_a(String)
          expect(user.token).to be_a(String)
          expect(user.token_expiration).to be_a(String)
        end
      end
    end

    describe "#github_auth" do
     it "returns user info of github login" do
       VCR.use_cassette("DO_NOT_DELETE_eliza_user_github") do
        user = @facade.github_auth(
          {
            login: "elizakeating",
            uid: "134974541",
            access_token: "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"
          }
        )

        expect(user).to be_a(User)
        expect(user.id).to be_a(String)
        expect(user.uid).to be_a(String)
        expect(user.email).to be_a(String)
        expect(user.username).to be_a(String)
        expect(user.token).to eq(nil)
        expect(user.token_expiration).to eq(nil)
        expect(user.auth_token).to be_a(String)
        expect(user.campaigns).to be_an(Array)
       end
     end
    end
  end
end