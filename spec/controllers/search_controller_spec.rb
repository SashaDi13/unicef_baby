require 'rails_helper'

RSpec.describe SearchController, elasticsearch: true, type: :controller do
  let!(:article) { create(:article, title: "Ім'я") }
  let!(:document) { create(:document, title: "Категорія")}

  before do
    create_list(:article, 5)
    create_list(:document, 5)
    Article.__elasticsearch__.import
    Document.__elasticsearch__.import
  end

  describe "GET /search" do

    context "article" do

      it 'find article with title' do
        get search_path(query: "Ім'я")
        expect(response.body).to include(article.title)
        expect(Article.records.length).to eq(1)
      end

      it 'find article with description' do
          get search_path(query: article.description.split[0])
        expect(response.body).to include(article.description)
      end
    end

    context "document" do

      it 'should find document with title' do
        get search_path(query: "Категорія")
        expect(response.body).to include(document.title)
        expect(Document.records.length).to eq(1)
      end

      it 'should find document with description' do
        get search_path(query: document.description)
        expect(response.body).to include(document.description)
      end
    end

    it 'shouldn`t find anything' do
      get search_path(query:'заголовок')
      expect(response.body).to include('Не знайдено результатів по заголовок')
    end

    it 'return several results' do
      article.update(title: 'Додаток 1')
      document.update(title: 'Додаток 1')
      get search_path(query: 'Додаток 1')
      expect(response.body).to include(article.title).twice
    end
  end
end
