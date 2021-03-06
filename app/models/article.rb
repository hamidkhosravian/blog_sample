class Article < ApplicationRecord
  belongs_to :user
  has_many :comments

  validates :title, presence: true
  validates :body, presence: true

  def is_owner?(current_user)
    user == current_user
  end
end
