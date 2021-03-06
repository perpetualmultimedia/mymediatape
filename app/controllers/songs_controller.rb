class SongsController < ApplicationController
  before_action :set_song, only: [:show, :edit, :update, :destroy]

  # GET /songs
  # GET /songs.json
  def index
    @songs = Song.all
  end

  # GET /songs/1
  # GET /songs/1.json
  def show
  end

  # GET /songs/new
  def new
    @album = Album.find(params[:album_id])
    @band = nil
    @album.songs = @album.songs.sort_by &:track_number
    @song = Song.new
  end

  # GET /songs/1/edit
  def edit
    @album = Album.find(params[:album_id])
    @band = nil
    @album.songs = @album.songs.sort_by &:track_number
    @song.album_id = params[:album_id]
    @song = Song.new
  end

  # POST /songs
  # POST /songs.json
  def create
    @song = Song.new(song_params)
    @album = Album.find(params[:album_id])
    @song.album_id = params[:album_id]
    respond_to do |format|
      if @song.save
        format.html { redirect_to  new_album_song_path(@album, @song), notice: 'Song was successfully created.' }
        format.json { render :show, status: :created, location: @song }
      else
        format.html { render :new }
        format.json { render json: @song.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /songs/1
  # PATCH/PUT /songs/1.json
  def update
    respond_to do |format|
      if @song.update(song_params)
        format.html { redirect_to edit_album_song_path(@album, @song), notice: 'Song was successfully updated.' }
        format.json { render :show, status: :ok, location: @song }
      else
        format.html { render :edit }
        format.json { render json: @song.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /songs/1
  # DELETE /songs/1.json
  def destroy
    @song.destroy
    respond_to do |format|
      format.html { redirect_to songs_url, notice: 'Song was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
  # def set_song_id
  #   set_song
  #   session[:song_id] = @song.id
  #   session[:album_id] = @song.album_id
  #   session[:band_id] = @song.album.band_id
  #   redirect_to band_album_path(@song.album.band_id, @song.album_id), tubolinks: false
  # end
  def vote
    value = params[:type] == "up" ? 1 : -1
    @song = Song.find(params[:id])
    @song.add_or_update_evaluation(:votes, value, current_user)
    redirect_to :back, notice: "Thank you for voting!"
  end

  private
  
    # Use callbacks to share common setup or constraints between actions.
    def set_song
      @song = Song.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def song_params
      params.require(:song).permit(:title, :track_number, :description, :album_id, :audio_file)
    end
end
