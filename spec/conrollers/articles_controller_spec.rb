require 'rails_helper'

RSpec.describe ArticlesController, type: :controller do

  let(:category) { 1 }
  let(:article) { create(:article, category_id: category,
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
      # let(:article_params) { { title: "dDDDd", description: "ffffdddddddddddddddddddddd", category_id: category, published_at: Time.zone.now } }
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

    describe "POST #create" do

      it 'creates article with valid params' do
        article_params[:category_id] = category
        post :create, params: { article: article_params }

        expect(response).to redirect_to(category_article_path(Article.last.category_id, Article.last.id))
      end

      it 'does not create article with invalid params' do
        article_params[:title] = nil
        post :create, params: { article: article_params }

        expect(response).to render_template("articles/new")
      end
    end

    describe "PATCH #update" do
      it "returns http success if signed in as admin" do
        # patch :update, params: { article: article_params }
        # expect(response).to have_http_status(:redirect)
        article_params[:title] =  "Unko-chan"

        patch :update, params: { id: article.id, article: article_params }

        expect(article.reload.title).to  eq ("Unko-chan")
      end

      it 'does not create unit with invalid params' do
        article_params[:title] = nil
        patch :update, params: { id: article.id, article: article_params }

        expect(response).to render_template("articles/edit")
      end
    end

    describe "DELETE #destroy" do
      it "return success if destroy article" do
        delete :destroy,  params: { id: article.id }
        expect(response).to have_http_status(:redirect)
      end
    end
  end
end
