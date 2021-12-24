module FirstArticlesHelper
  def first_article(category)
    category.articles.first
  end
end
