class NotificationMailer < ActionMailer::Base
  default from: "contact@columbuspowdercoat.com"
  default to: "contact@columbuspowdercoat.com"

  def new_message(message)
    @message = message
    mail(subject: "[columbuspowdercoat.com] #{message.subject}")
  end

  def new_quote(quote)
    @quote = Quote.find(quote.id)
    mail(subject: "CPC:You've recieved an RFQ!")
  end
end