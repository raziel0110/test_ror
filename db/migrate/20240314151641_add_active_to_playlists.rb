class AddActiveToPlaylists < ActiveRecord::Migration[7.1]
  def change
    add_column :playlists, :active, :boolean, default: false
  end
end
