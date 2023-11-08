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
  end
end