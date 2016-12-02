class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :edit, :update, :destroy]

  # GET /articles
  # GET /articles.json
  def index
    if current_user.admin? || current_user.editor?
      @articles = Article.all
    end
    if current_user.articles.present?
      @articles = current_user.articles
    end
  end

  # GET /articles/1
  # GET /articles/1.json
  def show
      @article.article_comments.build
    if @article.band_id.present?
    @band = Band.find(@article.band_id)
    @activities = PublicActivity::Activity.where(owner_id: @band.id).order('created_at DESC').limit(4)
  end
  end

  # GET /articles/new
  def new
    @article = Article.new
    @article.article_photos.build
  end

  # GET /articles/1/edit
  def edit
  end

  # POST /articles
  # POST /articles.json
  def create
    @article = current_user.articles.build(article_params)
    respond_to do |format|
      if @article.save
        format.html { redirect_to @article, notice: 'Article was successfully created.' }
        format.json { render :show, status: :created, location: @article }
      else
        format.html { render :new }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /articles/1
  # PATCH/PUT /articles/1.json
  def update
    respond_to do |format|
      if @article.update(article_params)
        format.html { redirect_to @article, notice: 'Article was successfully updated.' }
        format.json { render :show, status: :ok, location: @article }
      else
        format.html { render :edit }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /articles/1
  # DELETE /articles/1.json
  def destroy
    @article.destroy
    respond_to do |format|
      format.html { redirect_to articles_url, notice: 'Article was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
  def band_id=(id)
    self.band = Band.find_or_create_by_name(grouname) if name.present?
  end
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_article
      @article = Article.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def article_params
      params.require(:article).permit(:title, :body, :user_id, :band_id, :public, article_comments_attributes: [:user_id, :article_id, :body, :_destroy, :id], article_photos_attributes: [:image, :article_id, :_destroy, :id])
    end
end
