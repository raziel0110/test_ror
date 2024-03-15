class AddUserIdToPlaylists < ActiveRecord::Migration[7.1]
  def change
    add_reference :playlists, :user, null: false, foreign_key: true
  end
end
