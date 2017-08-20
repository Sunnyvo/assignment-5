require 'test_helper'

class LoginfailedMailerTest < ActionMailer::TestCase
  test "notify_login_failed" do
    mail = LoginfailedMailer.notify_login_failed
    assert_equal "Notify login failed", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
