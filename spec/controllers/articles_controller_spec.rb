require 'rails_helper'

RSpec.describe ArticlesController, type: :controller do
  let(:category) { create(:category) }
  let(:article) { create(:article, category_id: category.id,
                                   published_at: Time.zone.now - 10.minutes) }
  describe "GET #index" do
    it "renders the index template" do
      get :index
      expect(response).to render_template("articles/index")
    end
  end

  describe "GET #show" do
    it "renders the show template" do
      get :show, params: {category_id: article.category_id, id: article.id}
      expect(response).to render_template("articles/show")
    end
  end

  context "if admin" do
    login_admin
    let(:article_params) { attributes_for(:article) }

    describe "GET #new" do
      it "returns http success if signed in as admin" do
        get :new
        expect(response).to render_template("articles/new")
      end
    end

    describe "GET #edit" do
      it "returns http success if signed in as admin" do
        get :edit, params: {category_id: article.category_id, id: article.id}
        expect(response).to render_template("articles/edit")
      end
    end

    context "valid params" do
      before { article_params[:title] = "Unko-chan" }

      describe "POST #create" do
        it 'creates article with valid params' do
          post :create, params: { article: article_params }
          expect(response).to redirect_to(category_article_path(Article.last.category_id, Article.last.id))
        end
      end

      describe "PATCH #update" do
        it "returns http success if signed in as admin" do
          patch :update, params: { id: article.id, category_id: article.category_id, article: article_params }
          expect(article.reload.title).to  eq("Unko-chan")
        end
      end
    end

    context "invalid params" do
      before { article_params[:title] = nil }
      describe "POST #create" do
        it 'does not create article with invalid params' do
          post :create, params: { article: article_params }
          expect(response).to render_template("articles/new")
        end
      end

      describe "PATCH #update" do
        it 'does not create unit with invalid params' do
          patch :update, params: { id: article.id, category_id: article.category_id, article: article_params }
          expect(response).to render_template("articles/edit")
        end
      end
    end

    describe "DELETE #destroy" do
      it "return success if destroy article" do
        delete :destroy,  params: { id: article.id }
        expect(response).to have_http_status(:redirect)
      end
    end

    describe "#download_images" do
      let(:article) { create(:article, category_id: category.id, title: "New Article",
                                       published_at: Time.zone.now - 10.minutes, image: "1.png") }
      it "should export zip file with all articles images" do
        get :download_images, format: :zip
        let(:mock_file) { Zip::File.open("images.zip") }
        expect(response.headers['Content-Type']).to have_content "application/zip"
        allow(Zip::File).to receive(:open) { |&block| block.call(mock_file) }
        "#{article.category_id}_#{article.title}_#{article.id}.png"
      end
    end
  end
end
