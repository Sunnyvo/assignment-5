# Preview all emails at http://localhost:3000/rails/mailers/removefriend_mailer
class RemovefriendMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/removefriend_mailer/notify_end_friend
  def notify_end_friend
    RemovefriendMailer.notify_end_friend
  end

end
