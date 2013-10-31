class MessageNotifier < ActionMailer::Base
  default from: "Sky Memories <no-reply@skymemories.ru>", to: "info@skymemories.ru"

  def msg msg
    headers[:reply_to] = "#{msg['name']} <#{msg['email']}>"
    @msg = msg['message']
    @name = msg['name']
    mail
  end
end
