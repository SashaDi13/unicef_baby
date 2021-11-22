require 'zip'

class ArticlesController < ApplicationController
  before_action :find_article, except: [:index, :create, :new, :download_images]
  before_action :load_categories
  before_action :authenticate_admin!, except: [:index, :show]
  def index
    @articles = collection
  end

  def show
    @articles = collection
  end

  def edit
  end

  def  new
    @article = collection.new
  end

  def create
    @article = collection.create(article_params.merge(published_at: Time.zone.now))
    if @article.errors.empty?
      flash[:notice] = 'Article create succesfully!'
      SendNotifAboutNewArticleJob.perform_now(@article)
      redirect_to category_article_path(@article.category_id, @article.id)
    else
      flash.now[:warning] = 'Wrong input data. Article wasn`t created'
      render :new
    end
  end

  def update
    if @article.update(article_params)
      flash[:notice] = 'Article update succesfully!'
      redirect_to category_article_path(@article.category_id, @article.id)
    else
      flash.now[:warning] = 'Wrong input data. Article wasn`t updated'
      render :edit
    end
  end

  def destroy
    @article.destroy
    flash[:notice] = 'Article succesfully deleted!'
    redirect_to category_articles_path(@article.category_id)
  end

  def download_images
    zip_file = File.new("images.zip", 'w')

    Zip::File.open(zip_file.path, Zip::File::CREATE) do |zip|
      collection.each do |article|
        zip.add("#{article.category_id}_#{article.title}_#{article.id}.png", "public#{article.image.url}")
      end
    end

    zip_data = File.read(zip_file.path)
    send_data(zip_data, type: 'application/zip', disposition: 'attachment', filename: "images.zip")
    respond_to do |format|
      format.zip
      # articles_path
    end
  end

  private

    def article_params
      params.require(:article).permit(:title, :description, :image,
                                      :category_id,
                                      :published_at)
    end

    def collection
      Article.published
    end

    def resource
      collection.find(params[:id])
    end

    def find_article
      @article = resource
    end
end
