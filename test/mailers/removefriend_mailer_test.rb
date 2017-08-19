require 'test_helper'

class RemovefriendMailerTest < ActionMailer::TestCase
  test "notify_end_friend" do
    mail = RemovefriendMailer.notify_end_friend
    assert_equal "Notify end friend", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
