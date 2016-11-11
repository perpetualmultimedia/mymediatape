class StaticPagesController < ApplicationController
  def home
  	@bands = Band.with_reputation(:votes).order("votes DESC")
  	@albums = Album.all
  	@songs = Song.all
    if user_signed_in?
      @activities = PublicActivity::Activity.where(owner_id: current_user.following_ids).order('created_at DESC')
    else
      @activities = PublicActivity::Activity.all
    end
  end


  def help
  end

  def sign_up_success
  end
end
