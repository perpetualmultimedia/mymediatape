class ArticlePhotosController < ApplicationController
  before_action :set_article_photo, only: [:show, :edit, :update, :destroy]

  # GET /article_photos
  # GET /article_photos.json
  def index
    @article_photos = ArticlePhoto.all
  end

  # GET /article_photos/1
  # GET /article_photos/1.json
  def show
  end

  # GET /article_photos/new
  def new
    @article_photo = ArticlePhoto.new
  end

  # GET /article_photos/1/edit
  def edit
  end

  # POST /article_photos
  # POST /article_photos.json
  def create
    @article_photo = ArticlePhoto.new(article_photo_params)

    respond_to do |format|
      if @article_photo.save
        format.html { redirect_to @article_photo, notice: 'Article photo was successfully created.' }
        format.json { render :show, status: :created, location: @article_photo }
      else
        format.html { render :new }
        format.json { render json: @article_photo.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /article_photos/1
  # PATCH/PUT /article_photos/1.json
  def update
    respond_to do |format|
      if @article_photo.update(article_photo_params)
        format.html { redirect_to @article_photo, notice: 'Article photo was successfully updated.' }
        format.json { render :show, status: :ok, location: @article_photo }
      else
        format.html { render :edit }
        format.json { render json: @article_photo.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /article_photos/1
  # DELETE /article_photos/1.json
  def destroy
    @article_photo.destroy
    respond_to do |format|
      format.html { redirect_to article_photos_url, notice: 'Article photo was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_article_photo
      @article_photo = ArticlePhoto.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def article_photo_params
      params.require(:article_photo).permit(:article_id, :photo)
    end
end
