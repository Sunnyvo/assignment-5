class RemovefriendMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.removefriend_mailer.notify_end_friend.subject
  #
  def notify_end_friend
    @greeting = "Hi"

    mail to: "to@example.org"
  end
end
