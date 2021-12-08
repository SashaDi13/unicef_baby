module SameArticlesHelper
  def rand_article
    # current_article = @articles.find(params[:id])
    # article = @articles.where("category_id = ? OR subject = ?", params[:category_id], current_article.subject)
    @articles = @articles.where("category_id = ? AND id != ?" ,params[:category_id], params[:id]).order("RANDOM()").limit(3)
  end
end
