class Post < ApplicationRecord
  validates :body, presence: true
  belongs_to :poster, class_name: "User"
  belongs_to :waller, class_name: "User"
  has_many :likes, as: :item
  has_many :comments, dependent: :destroy
  mount_uploader :photo, AvatarUploader

end
