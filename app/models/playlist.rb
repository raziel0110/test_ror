class Playlist < ApplicationRecord
  validates :name, presence: true, length: {minimum:3}, uniqueness: true

  belongs_to :user

  scope :by_recently_created, -> { order(created_at: :desc) }

  def active?
    self.active == true
  end

  def inactive?
    self.active == false
  end
end
