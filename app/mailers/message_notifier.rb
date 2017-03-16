class MessageNotifier < ActionMailer::Base
  default from: 'Maevsky Pictires contact form <no-reply@skymemories.ru>',
          to: 'max@maevskypictures.ru'

  def msg(msg)
    headers[:reply_to] = "#{msg['name']} <#{msg['email']}>"
    @msg = msg['message']
    @name = msg['name']
    mail
  end
end
