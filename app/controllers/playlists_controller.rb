class PlaylistsController < ApplicationController
  before_action :authenticate_user!

  def index
    @playlists = Playlist.by_recently_created

    render
  end

  def create

  end
end
