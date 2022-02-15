require 'rails_helper'

RSpec.describe SearchController, type: :controller do
  let!(:article) { create(:article) }
  let!(:document) { create(:document)}

  before do
    create_list(:article, 5)
    create_list(:document, 5)
    Article.__elasticsearch__.import
    Document.__elasticsearch__.import
  end

  describe "GET /search" do

    let!(:article_1) { create(:article, title: "Ім'я" ) }

    it 'should be indexed' do
      get search_path(query: "Ім'я")
      expect(response.body.records.length).to eq(1)
    end

    context "article" do
      it 'find article with title' do
          get search_path(query: article.title)
        expect(response.body).to include(article.title)
      end

      it 'find article with description' do
          get search_path(query: article.description)
        expect(response.body).to include(article.description)
      end
    end

    context "document" do
      it 'should find document with title' do
        get search_path(query: document.title)
        expect(response.body).to include(document.title)
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
      article.first.update(title: 'Додаток 1')
      document.first.update(title: 'Додаток 1')
      get search_path('Додаток 1')
      expect(response.body.records.length).to eq(2)
    end
  end
end
