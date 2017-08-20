# Preview all emails at http://localhost:3000/rails/mailers/loginfailed_mailer
class LoginfailedMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/loginfailed_mailer/notify_login_failed
  def notify_login_failed
    LoginfailedMailer.notify_login_failed
  end

end
