module SameArticlesHelper
  def rand_article(articles)
    current_article = articles.find(params[:id])
    articles.where("category_id = ? OR subject = ? AND id != ?" ,params[:category_id], current_article.subject, current_article.id).order("RANDOM()").limit(3)
  end
end
