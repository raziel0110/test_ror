class Track < ApplicationRecord
  belongs_to :user

  validates :filename, presence: true

  scope :by_recent, -> { order(created_at: :desc) }
end
