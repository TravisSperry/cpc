# frozen_string_literal: true

ActionMailer::Base.smtp_settings = {
  address: 'smtp.gmail.com',
  port: 587,
  domain: 'columbuspowdercoat.com',
  user_name: ENV['CPC_GMAIL_USERNAME'],
  password: ENV['CPC_GMAIL_PASSWORD'],
  authentication: :plain,
  enable_starttls_auto: true
}
