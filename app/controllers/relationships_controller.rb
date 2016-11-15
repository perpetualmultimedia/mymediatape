class RelationshipsController < ApplicationController

  def create
  	band = Band.find(params[:followed_id])
    current_user.follow(band)
    redirect_to(:back, turbolinks: true, notice: "Successfully followed artist!")
  end

  def destroy
  	band = Relationship.find(params[:id]).followed
    current_user.unfollow(band)
    redirect_to(:back, turbolinks: true, notice: "Successfully unfollowed artist!")
  end
end