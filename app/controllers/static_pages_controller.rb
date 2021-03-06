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
    
    if params[:q].present?
      @q = Band.search(params[:q])
      @activities = PublicActivity::Activity.all.order('created_at DESC')
      @topbands = Band.where("state = :b", b: params[:q]).with_reputation(:votes).order("votes DESC").result
      @albums = Album.joins(:band).where(bands: {state: params[:q]}).with_reputation(:votes).reorder("votes DESC").result
      @songs = Song.joins(album: :band).where(bands: {state: params[:q]}).with_reputation(:votes).reorder("votes DESC").result
    else
      @activities = PublicActivity::Activity.all.order('created_at DESC')
      @topbands = Band.with_reputation(:votes).order("votes DESC").limit(10)
      @albums = Album.all.limit(10).with_reputation(:votes).reorder("votes DESC")
      @songs = Song.all.limit(10).with_reputation(:votes).reorder("votes DESC")
    end
  end
  def everything
    session[:state_cont] = params[:state_cont]  
    @state = State.find_by_id(session[:state_cont])
   
    if @state.present?
      @activities = PublicActivity::Activity.all.order('created_at DESC')
      @topbands = Band.where(state: @state).with_reputation(:votes).order("votes DESC")
      @albums = Album.joins(:band).where(bands: {state: @state}).with_reputation(:votes).reorder("votes DESC")
      @songs = Song.joins(album: :band).where(bands: {state: @state}).with_reputation(:votes).reorder("votes DESC")
    else
      @activities = PublicActivity::Activity.all.order('created_at DESC')
      @topbands = Band.with_reputation(:votes).order("votes DESC").limit(5)
      @albums = Album.all.limit(10).with_reputation(:votes).reorder("votes DESC").limit(5)
      @songs = Song.all.limit(10).with_reputation(:votes).reorder("votes DESC").limit(5)
    end
  end
  def national
    @activities = PublicActivity::Activity.all.order('created_at DESC')
    @bands = Band.with_reputation(:votes).order("votes DESC").limit(5)
    @albums = Album.all.limit(10).with_reputation(:votes).reorder("votes DESC").limit(5)
    @songs = Song.all.limit(10).with_reputation(:votes).reorder("votes DESC").limit(5)
  end
  def become_a_writer
    @articles = Article.all
  end
  def help
  end

  def sign_up_success
  end

end
