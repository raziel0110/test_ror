module Concerns
  module HasPlaylist
    extend ActiveSupport::Concern

    private

    def playlist_params
      params.require(:playlist).permit(:name, :active, :created_at, :user_id)
    end

    def set_inactive
      Playlist.all.update_all(active: false)
    end
  end
end
