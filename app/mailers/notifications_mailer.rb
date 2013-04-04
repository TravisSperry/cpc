class NotificationsMailer < ActionMailer::Base
  default :from => "contact@columbuspowdercoat.com"
  default :to => "travis@columbuspowdercoat.com"

  def new_message(message)
    @message = message
    mail(:subject => "[columbuspowdercoat.com] #{message.subject}", :body => "From: #{message.email}- #{message.body}")
  end
end
