module Api
  module V1
    class PlaylistsController < ApplicationController
      # TODO: Add API login along side web authentication in order to be allowed to upload file

      include Concerns::NotFound
      include Concerns::HasPlaylist

      skip_before_action :verify_authenticity_token
      before_action :set_playlist, only: [:destroy, :update, :show]

      def index
        @playlists = Playlist.by_recently_created

        render json: @playlists, each_serializer: PlaylistSerializer
      end

      def create
        set_inactive
        playlist = Playlist.new(playlist_params.merge(active: true))

        if playlist.save
          render json: playlist, serialize: PlaylistSerializer, status: 201
        else
          render json: {errors: playlist.errors.full_messages}, status: 422
        end
      end

      def update
        set_inactive
        @playlist.update_attribute(:active, true)

        render json: @playlist, serialize: PlaylistSerializer, status: 200
      end

      def destroy
        @playlist.destroy

        render json: { message: "Playlist destroyed" }, status: 200
      end

      def show
        # used for display Audio songs
      end

      private

      def set_playlist
        @playlist = Playlist.find(params[:id])
      rescue ActiveRecord::RecordNotFound
        handle_not_found
      end
    end
  end
end
