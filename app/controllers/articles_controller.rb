require 'zip'

class ArticlesController < ApplicationController
  before_action :authenticate_admin!, except: [:index, :show]

  def index
    @articles = collection
  end

  def show
    @article = resource
    @articles = collection
  end

  def edit
    @article = resource
  end

  def  new
    @article = collection.new
  end

  def create
    @article = collection.build(article_params.merge(published_at: Time.zone.now))
    if @article.save
      flash[:notice] = 'Article create succesfully!'
      SendNotifAboutNewArticleJob.perform_now(@article)
      NOTIFIER.ping "Нова стаття була створена.<a href='#{category_article_url(@article.category, @article.id)}'> Перегляньте її</a>"
      redirect_to category_article_path(@article.category, @article.id)
    else
      flash.now[:warning] = 'Wrong input data. Article wasn`t created'
      render :new
    end
  end

  def update
    @article = resource
    if @article.update(article_params)
      flash[:notice] = 'Article update succesfully!'
      redirect_to category_article_path(@article.category, @article.id)
    else
      flash.now[:warning] = 'Wrong input data. Article wasn`t updated'
      render :edit
    end
  end

  def destroy
    @article = resource
    @article.destroy
    flash[:notice] = 'Article succesfully deleted!'
    redirect_to category_path(@article.category)
  end

  def download_images
    zip_file = File.new("images.zip", 'w')

    Zip::File.open(zip_file.path, Zip::File::CREATE) do |zip|
      collection.each do |article|
        zip.add("#{article.category_id}_#{article.title}_#{article.id}.png", "public#{article.image.url}") if article.image.present?
      end
    end

    zip_data = File.read(zip_file.path)
    send_data(zip_data, type: 'application/zip', disposition: 'attachment', filename: "images.zip")

    zip_file.close
  end

  private

    def article_params
      params.require(:article).permit(:title, :description, :image,
                                      :category_id,
                                      :published_at, :age, :subject)
    end

    def collection
      Article.published
    end

    def resource
      collection.find(params[:id])
    end
end
