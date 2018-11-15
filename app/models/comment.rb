class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :article

  validates :body, presence: true

  def is_owner?(current_user)
    user == current_user
  end
end
