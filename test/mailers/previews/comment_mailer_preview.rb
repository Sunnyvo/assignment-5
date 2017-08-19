# Preview all emails at http://localhost:3000/rails/mailers/comment_mailer
class CommentMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/comment_mailer/notify_new_comment
  def notify_new_comment
    CommentMailer.notify_new_comment
  end

end
