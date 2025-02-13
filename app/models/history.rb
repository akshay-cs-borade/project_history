class History < ApplicationRecord
  belongs_to :project
  belongs_to :user

  validates :previous_status, :new_status, presence: true
end
