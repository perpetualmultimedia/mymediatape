class AlbumsController < ApplicationController
  before_action :set_album, only: [:show, :edit, :update, :destroy]

  # GET /albums
  # GET /albums.json
  def index
    @band = Band.find(params[:band_id])
    @albums = @band.albums
  end

  # GET /albums/1
  # GET /albums/1.json
  def show
    set_album
    @album.album_comments.build
    @band = @album.band.id
    @album.songs = @album.songs.sort_by &:track_number
  end

  # GET /albums/new
  def new
    @band = Band.find(params[:band_id])
    @album = @band.albums.build
    @album.songs.build

  end

  # GET /albums/1/edit
  def edit
  end

  # POST /albums
  # POST /albums.json
  def create
    @album = Band.find(params[:band_id]).albums.build(album_params)

    respond_to do |format|
      if @album.save
        format.html { redirect_to band_albums_path(@album.band.id), notice: 'Album was successfully created.' }
        format.json { render :show, status: :created, location: @album }
      else
        format.html { render :new }
        format.json { render json: @album.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /albums/1
  # PATCH/PUT /albums/1.json
  def update
    respond_to do |format|
      if @album.update(album_params)
        format.html { redirect_to band_albums_path(@album.band.id), notice: 'Album was successfully updated.' }
        format.json { render :show, status: :ok, location: @album }
      else
        format.html { render :edit }
        format.json { render json: @album.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /albums/1
  # DELETE /albums/1.json
  def destroy
    @album.destroy
    respond_to do |format|
      format.html { redirect_to band_albums_url(@album.band.id), notice: 'Album was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
  def vote
    value = params[:type] == "up" ? 1 : -1
    @album = Album.find(params[:id])
    @album.add_or_update_evaluation(:votes, value, current_user)
    redirect_to :back, notice: "Thank you for voting!"
  end
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_album
      @album = Album.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def album_params
      params.require(:album).permit(:name, :album_art, :type, :released, :description, :band_id, songs_attributes: [:title, :track_number, :description, :audio_file, :album_id, :id, :_destroy])
    end
end
