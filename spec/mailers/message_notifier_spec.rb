require "spec_helper"

describe MessageNotifier do
  describe "msg" do
    let(:msg) { FactoryGirl.attributes_for(:message).with_indifferent_access }
    let(:mail) { MessageNotifier.msg msg }

    it "renders the headers" do
      mail.subject.should eq("Сообщение с сайта skymemories.ru")
      mail.to.should eq(["info@skymemories.ru"])
      mail.from.should eq(["no-reply@skymemories.ru"])
      mail.reply_to.should eq(["test@test.com"])
    end

    it "renders the body" do
      mail.body.encoded.should match "Test message body.\r\n\r\nSmith\r\n"
    end
  end

end
