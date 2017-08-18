class NotifySlack < ApplicationRecord
  def initialize
    @notifier = Slack::Notifier.new ENV["SLACK_WEBHOOK_URL"]
  end

  def notify_new_post(post)
    @notifier.ping(post.body,
      username: post.poster.name_or_email,
      icon_url: post.poster.avatar.url
    )
  end
end
