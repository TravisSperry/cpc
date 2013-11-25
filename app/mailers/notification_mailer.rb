class NotificationMailer < ActionMailer::Base
  default from: "contact@columbuspowdercoat.com"
  default to: "contact@columbuspowdercoat.com"

  def new_message(message)
    @message = message
    mail(subject: "[columbuspowdercoat.com] #{message.subject}")
  end
end