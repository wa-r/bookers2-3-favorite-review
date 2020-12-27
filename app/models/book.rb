class Book < ApplicationRecord
	belongs_to :user
	has_many :likes, dependent: :destroy

	validates :title, presence: true
	validates :body, presence: true, length: {maximum: 200}


  def liked_by?(user)
    likes.where(user_id: user.id).exists?
  end
end