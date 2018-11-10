class BandsController < ApplicationController
  before_action :set_band, only: [:edit, :update, :destroy]

  # GET /bands
  # GET /bands.json
  def index
  session[:state_cont] = params[:state_cont]  
  @state = State.find_by_id(session[:state_cont])
   
    if @state.present?
      @activities = PublicActivity::Activity.all.order('created_at DESC')
      @topbands = Band.where(state: @state).with_reputation(:votes).order("votes DESC")
      @albums = Album.joins(:band).where(bands: {state: @state}).with_reputation(:votes).reorder("votes DESC")
      @songs = Song.joins(album: :band).where(bands: {state: @state}).with_reputation(:votes).reorder("votes DESC")
    else
      @activities = PublicActivity::Activity.all.order('created_at DESC')
      @topbands = Band.with_reputation(:votes).order("votes DESC").limit(10)
      @albums = Album.all.limit(10).with_reputation(:votes).reorder("votes DESC")
      @songs = Song.all.limit(10).with_reputation(:votes).reorder("votes DESC")
    end
  end

  # GET /bands/1
  # GET /bands/1.json
  def show
    @band = Band.friendly.find(params[:id])
    @topsongs = @band.songs.with_reputation(:votes).reorder("votes DESC")
    @user = current_user
    @album = @band.albums
    @event = @band.events
    @articles = Article.where(band_id: @band.id).where(public: true)
    @band.state = State.find(@band.state).name
    if user_signed_in? 
      @vote = current_user.evaluations('rating').where(target_type: Band, target_id: @band.id).first
    end
  end

  # GET /bands/new
  def new
    @band = Band.new
    @band.members.build
  end

  # GET /bands/1/edit
  def edit
  end

  # POST /bands
  # POST /bands.json
  def create
    @band = current_user.bands.build(band_params)


    respond_to do |format|
      if @band.save
        format.html { redirect_to @band, notice: 'Band was successfully created.' }
        format.json { render :show, status: :created, location: @band }
      else
        format.html { render :new }
        format.json { render json: @band.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /bands/1
  # PATCH/PUT /bands/1.json
  def update
    respond_to do |format|
      if @band.update(band_params)
        format.html { redirect_to @band, notice: 'Band was successfully updated.' }
        format.json { render :show, status: :ok, location: @band }
      else
        format.html { render :edit }
        format.json { render json: @band.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bands/1
  # DELETE /bands/1.json
  def destroy
    @band.destroy
    respond_to do |format|
      format.html { redirect_to bands_url, notice: 'Band was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
  def vote
    value = params[:type] == "up" ? 1 : 0
    @band = Band.find(params[:id])
    @band.add_or_update_evaluation(:votes, value, current_user)
    redirect_to :back, notice: "Thank you for voting!"
  end
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_band
      @band = Band.friendly.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def band_params
      params.require(:band).permit(:group_name, :handle, :store, :band_avatar, :genre, :city, :state, :user_id, :description, :website, members_attributes: [:first_name, :last_name, :email, :band_id, :id, :_destroy])
    end
end
