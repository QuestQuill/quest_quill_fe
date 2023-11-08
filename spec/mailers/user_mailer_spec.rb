require "rails_helper"

RSpec.describe UserMailer, type: :mailer do
  it "passwordless_login" do
    VCR.use_cassette("email_contents") do
      mail = UserMailer.with(email: "bobsmith@gmail.com").passwordless_login.deliver_now

      expect(mail.subject).to eq("Passwordless Login Request")
      expect(mail.from).to eq(["login@quest-quill.com"])
      expect(mail.to).to eq(["bobsmith@gmail.com"])

      expect(mail.text_part.body.to_s).to include("Hello bobsmith!")
      expect(mail.text_part.body.to_s).to include("You have requested a passwordless login to QuestQuill,")
      expect(mail.text_part.body.to_s).to include("please click the following link to sign in:")
      expect(mail.text_part.body.to_s).to include("Thanks and have a great day!")

      expect(mail.html_part.body.to_s).to include("Hello bobsmith!")
      expect(mail.html_part.body.to_s).to include("You have requested a passwordless login to QuestQuill,")
      expect(mail.html_part.body.to_s).to include("please click the following link to sign in:")
      expect(mail.html_part.body.to_s).to include("Thanks and have a great day!")

      expect(mail.body.encoded).to include("Hello bobsmith!")
      expect(mail.body.encoded).to include("You have requested a passwordless login to QuestQuill,")
      expect(mail.body.encoded).to include("please click the following link to sign in:")
      expect(mail.body.encoded).to include("Thanks and have a great day!")
    end
  end
end