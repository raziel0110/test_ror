module Api
  module V1
    class PlaylistsController < ApplicationController
      include Concerns::NotFound

      skip_before_action :verify_authenticity_token
      before_action :set_playlist, only: [:destroy]

      def index
        @playlists = Playlist.by_recently_created

        render json: @playlists, each_serializer: PlaylistSerializer
      end

      def create
        # TODO: Add API login along side web authentication in order to be allowed to upload file
        playlist = Playlist.create(playlist_params)

        if playlist.save
          render json: playlist, serialize: PlaylistSerializer, status: 201
        else
          render json: {errors: playlist.errors.full_messages}, status: 422
        end
      end

      def update
        # TODO: activate deactivate playlist
      end

      def destroy
        @playlist.destroy

        render json: { message: "Playlist destroyed" }, status: 200
      end

      private

      def set_playlist
        @playlist = Playlist.find(params[:id])
      rescue ActiveRecord::RecordNotFound
        handle_not_found
      end

      def playlist_params
        params.require(:playlist).permit(:name, :active)
      end
    end
  end
end
