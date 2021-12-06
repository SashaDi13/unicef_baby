module SameArticlesHelper
  def rand_article
    id = rand(1..@articles.last.id)
    article = @articles.find(id) if params[:category_id] && id.present?
  end
end
