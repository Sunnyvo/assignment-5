class Like < ApplicationRecord
  belongs_to :user
  belongs_to :item, polymorphic: true

  def name_or_email
    user.name|| user.email
  end
end
