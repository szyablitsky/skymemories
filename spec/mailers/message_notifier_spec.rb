require 'spec_helper'

describe MessageNotifier do
  describe 'msg' do
    let(:msg) { FactoryGirl.attributes_for(:message).with_indifferent_access }
    let(:mail) { MessageNotifier.msg msg }

    it 'renders the headers' do
      expect(mail.subject).to eq('Сообщение с сайта maevskypictures.ru')
      expect(mail.to).to eq(['max@maevskypictures.ru'])
      expect(mail.from).to eq(['no-reply@maevskypictures.ru'])
      expect(mail.reply_to).to eq(['test@test.com'])
    end

    it 'renders the body' do
      expect(mail.body.encoded).to match "Test message body.\r\n\r\nSmith\r\n"
    end
  end

end
