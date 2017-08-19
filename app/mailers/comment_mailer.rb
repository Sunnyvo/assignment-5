class CommentMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.comment_mailer.notify_new_comment.subject
  #
  def notify_new_comment(comment)
    @comment = comment
    mail to: @comment.post.poster.email, subject: "someone comment on your post"
  end
end
