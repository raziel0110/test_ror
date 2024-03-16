class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable
  has_many :playlists, dependent: :delete_all
  has_many :tracks, dependent: :destroy

  def active_playlist
    playlists.where(active: true).first
  end
end
