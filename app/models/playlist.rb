class Playlist < ApplicationRecord
  validates :name, presence: true, length: {minimum:3}

  scope :by_recently_created, -> { order(created_at: :desc) }
end
