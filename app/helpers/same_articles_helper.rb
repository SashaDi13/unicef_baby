module SameArticlesHelper
  def rand_article(articles)
    articles.where("category_id = ? AND id != ?", params[:category_id], params[:id]).order("RANDOM()").limit(3)
  end
end
