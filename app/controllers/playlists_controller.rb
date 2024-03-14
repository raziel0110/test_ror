class PlaylistsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_playlist, only: [:update]

  def index
    @playlists = Playlist.by_recently_created

    render
  end

  def create
    # deactivate all playlists
    set_inactive

    @playlist = Playlist.new(playlist_params.merge(active: true))

    if @playlist.save
      redirect_to playlists_path, notice: "Playlist created"
    else
      @playlist = Playlist.new
      redirect_to playlists_path, error: "Playlist created"
    end
  end

  def update
    set_inactive

    @playlist.update_attribute(:active, true)
    flash[:notice] = "Playlist activated!"
    redirect_to playlists_path
  end

  private

  def playlist_params
    params.require(:playlist).permit(:name, :active, :created_at)
  end

  def set_playlist
    @playlist = Playlist.find(params[:id])
  end

  def set_inactive
    Playlist.all.update_all(active: false)
  end
end
