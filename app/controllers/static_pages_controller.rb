class StaticPagesController < ApplicationController
  def home
    #@articles = Article.text_search(params[:query]).where("place_id = :p", p: @place.id).limit(2)
  	@bands = Band.with_reputation(:votes).order("votes DESC")
  	@albums = Album.all
  	@songs = Song.all
    if user_signed_in?
      @activities = PublicActivity::Activity.where(owner_id: current_user.following_ids).order('created_at DESC')
    else
      @activities = PublicActivity::Activity.all.order('created_at DESC')
    end
  end

  def local
    if user_signed_in?
    @activities = PublicActivity::Activity.all.order('created_at DESC')
    @topbands = Band.where("state = :b", b: current_user.state).with_reputation(:votes).order("votes DESC")
    @albums = Album.joins(:band).where(bands: {state: current_user.state}).with_reputation(:votes).reorder("votes DESC")
    @songs = Song.joins(album: :band).where(bands: {state: current_user.state}).with_reputation(:votes).reorder("votes DESC")
  end
  end

  def national
    @activities = PublicActivity::Activity.all.order('created_at DESC')
    @bands = Band.with_reputation(:votes).order("votes DESC").limit(10)
    @albums = Album.all.limit(10).with_reputation(:votes).reorder("votes DESC")
    @songs = Song.all.limit(10).with_reputation(:votes).reorder("votes DESC")
  end

  def help
  end

  def sign_up_success
  end
end
