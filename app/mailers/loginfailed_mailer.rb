class LoginfailedMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.loginfailed_mailer.notify_login_failed.subject
  #
  def notify_login_failed
    @greeting = "Hi"

    mail to: "to@example.org"
  end
end
