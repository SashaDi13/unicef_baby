require 'rails_helper'

RSpec.describe "Articles", type: :request do
  let(:category) { create(:category) }
  let(:category_params) { attributes_for(:category) }
  describe "GET /articles" do
    let(:article) { create(:article, title: "Article", category_id: category.id, published_at: Time.zone.now - 10.minutes) }
    it "returns http success status" do

      get articles_path

      expect(response).to be_successful
      expect(response.body).to have_content("Article")
    end
  end

  describe "GET /articles/:id" do
    let(:article) { create(:article, category_id: category.id, published_at: Time.zone.now - 10.minutes) }
    it "returns http success status" do
      get category_article_path(article.category_id, article.id)

      expect(response).to be_successful
    end
  end
end
