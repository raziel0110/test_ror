class PlaylistsController < ApplicationController
  include Concerns::HasPlaylist

  before_action :authenticate_user!
  before_action :set_playlist, only: [:update, :show, :destroy]

  def index
    @playlists = Playlist.by_recently_created.where(user_id: current_user.id)

    render
  end

  def create
    set_inactive

    @playlist = Playlist.new(playlist_params.merge(active: true, user_id: current_user.id))

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

  def show
    # used for diplay Playlist page, where the user will add songs
  end

  def destroy
    @playlist.destroy

    flash[:notice] = "Playlist deleted!"
    redirect_to playlists_path
  end

  private

  def set_playlist
    @playlist = Playlist.find(params[:id])
  end
end
