class TracksController < ApplicationController
  before_action :authenticate_user!

  def index
    @tracks = Track.by_recent.where(user_id: current_user.id)
  end

  def create
  end

  def destroy
  end

  private

  def track_params
    params.require(:track).permit(:song)
  end
end
