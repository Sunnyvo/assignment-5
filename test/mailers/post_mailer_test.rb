require 'test_helper'

class PostMailerTest < ActionMailer::TestCase
  test "notify_new_post" do
    mail = PostMailer.notify_new_post
    assert_equal "Notify new post", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
