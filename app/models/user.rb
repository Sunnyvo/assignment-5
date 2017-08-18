class User < ApplicationRecord
  has_many :friendships, dependent: :destroy
  has_many :friends, through: :friendships
  has_many :sent_messages, class_name: "Message", foreign_key: "sender_id"
  has_many :received_messages, class_name: "Message", foreign_key: "receiver_id"
  has_many :posts, foreign_key: "poster_id"
  has_many :wallers, class_name: 'Post', foreign_key: "waller_id"
  has_many :likes, dependent: :destroy
  has_many :comments, dependent: :destroy
  validates :name, :email, presence: true
  mount_uploader :avatar, AvatarUploader

  has_secure_password

  def self.from_omniauth(auth)
    email = auth[:info][:email] || "#{auth[:uid]}@facebook.com"
    user = where(email: email).first_or_initialize
    user.image_url = auth[:info][:image]
    user.name = auth[:info][:name]
    user.password = SecureRandom.hex

    user.save && user
  end

  def image_url_or_default
    avatar.url|| image_url.presence || "science.jpg"
  end

  def add_friend(another_user)
    friends << another_user
  end

  def is_friend?(another_user)
    friends.include?(another_user)
  end

  def self.generate_users(n = 5, gender = "female")
    url = "https://randomuser.me/api?results=#{n}&gender=#{gender}"
    body = HTTP.get(url).parse
    body["results"].each do |person|
      hash = {}
      hash[:name] = person["name"]["first"] + " " + person["name"]["last"]
      hash[:email] = person["email"]
      hash[:password] = person["login"]["password"]
      hash[:image_url] = person["picture"]["large"]
      User.create! hash
    end
  end


  def friend_names
    friends.map{|e| e.name}
  end

  def self.except(user)
    all - [user]
  end

  def self.receiver_options(user)
    user.friends.map{|e| [e.name, e.id]}
  end

  def self.num_friends(user)
    Friendship.where(user: user).count
  end

  def self.num_friendedbys(user)
    Friendship.where(friend: user).count
  end

  def name_or_email
    name.present? ? name : email
  end

  def toggle_like!(item)
    if like = likes.where(item: item).first
      like.destroy
    else
      likes.where(item: item).create!
    end
  end

  def liking?(item)
    likes.where(item: item).exists?
  end

end
