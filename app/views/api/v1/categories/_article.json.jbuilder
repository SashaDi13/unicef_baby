json.extract! article, :id, :title, :published_at
json.url article_url(article, format: :json)
json.published true
