class ApplicationMailer < ActionMailer::Base
  default from: ENV['GOOGLE_MAIL']
  layout 'mailer'
end
