# frozen_string_literal: true

class NotificationMailer < ActionMailer::Base
  default from: 'contact@columbuspowdercoat.com'
  default to:
    [
      'paul@columbuspowdercoat.com',
      'nsmals@columbuspowdercoat.com',
      'jbuehler@columbuspowdercoat.com'
    ]

  def new_message(message)
    @message = message
    mail(subject: "[columbuspowdercoat.com] #{message.subject}")
  end

  def new_quote(quote_request)
    @quote_request = QuoteRequest.find(quote_request.id)
    mail(subject: "CPC:You've recieved an RFQ!")
  end

  def low_powder_notification(powder)
    @powder = powder
    mail(subject: "Your running low on #{powder.name}")
  end
end
