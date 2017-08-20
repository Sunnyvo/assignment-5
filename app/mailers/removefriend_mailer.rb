class RemovefriendMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.removefriend_mailer.notify_end_friend.subject
  #
  def notify_end_friend(cu,au)
    @current_user= cu
    @another_user = au
    mail to: @another_user.email , subject: "Some one end your relationship"
  end
end
