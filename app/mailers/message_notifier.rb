class MessageNotifier < ActionMailer::Base
  default from: "Sky Memories <no-reply@skymemories.ru>", to: "info@skymemories.ru"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.message_notifier.sent.subject
  #
  def msg msg
    headers[:reply_to] = "#{msg['name']} <#{msg['email']}>"
    @msg = msg['message']
    @name = msg['name']
    mail
  end
end
