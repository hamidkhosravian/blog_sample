class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  scope :newer, -> { order(id: :desc) }

  def is_owner?(current_user)
    self&.user == current_user
  end
end
