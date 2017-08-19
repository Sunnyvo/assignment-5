require 'test_helper'

class CommentMailerTest < ActionMailer::TestCase
  test "notify_new_comment" do
    mail = CommentMailer.notify_new_comment
    assert_equal "Notify new comment", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
