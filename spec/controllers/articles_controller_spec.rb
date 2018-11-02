require 'rails_helper'

RSpec.describe Api::V1::ArticlesController, type: :controller do
  let!(:articles) { create_list(:article, 3) }

  context "when called index" do
    it 'as a user' do
      sign_in
      get :index
      expect(response).to have_http_status(200)
      expect(JSON.parse(response.body)).to have_key("articles")
      expect(JSON.parse(response.body)["articles"].size).to eq 3
    end

    it 'as a guest' do
      get :index
      expect(response).to have_http_status(200)
      expect(JSON.parse(response.body)).to have_key("articles")
      expect(JSON.parse(response.body)["articles"].size).to eq 3
    end
  end

  context "when called show" do
    it 'as a user' do
      sign_in
      article = articles.sample
      get :show, params: { id: article.id }
      expect(response).to have_http_status(200)
      expect(JSON.parse(response.body)["id"]).to eq article.id
    end

    it 'as a guest' do
      article = articles.sample
      get :show, params: { id: article.id }
      expect(response).to have_http_status(200)
      expect(JSON.parse(response.body)["id"]).to eq article.id
    end

    it 'could not found article' do
      get :show, params: { id: 'invalid' }
      expect(response).to have_http_status(404)
    end
  end

  describe "when called create" do
    it "create succes" do
      sign_in
      post :create, params: FactoryBot.attributes_for(:article)
      expect(response).to have_http_status(201)
    end

    context "when creation is failer" do
      it 'without title' do
        sign_in
        post :create, params: FactoryBot.attributes_for(:article, title: nil)
        expect(response).to have_http_status(400)
      end

      it 'without body' do
        sign_in
        post :create, params: FactoryBot.attributes_for(:article, body: nil)
        expect(response).to have_http_status(400)
      end

      it 'as a guest user' do
        post :create, params: FactoryBot.attributes_for(:article, body: nil)
        expect(response).to have_http_status(401)
      end
    end
  end

  describe "when called update" do
    it "update succes" do
      sign_in
      article = create(:article, user: @current_user)
      put :update, params: { id: article.id, body: 'body', title: 'title' }
      expect(response).to have_http_status(200)
      expect(JSON.parse(response.body)["id"]).to eq article.id
    end

    it "update succes as a admin" do
      admin_sign_in
      article = articles.sample
      put :update, params: { id: article.id, body: 'body', title: 'title' }
      expect(response).to have_http_status(200)
      expect(JSON.parse(response.body)["id"]).to eq article.id
    end

    context "when creation is failer" do
      it 'the user is not owner' do
        sign_in
        article = create(:article)
        put :update, params: { id: article.id }
        expect(response).to have_http_status(401)
      end

      it 'as a guest user' do
        put :update, params: { id: articles.sample.id }
        expect(response).to have_http_status(401)
      end
    end
  end

  describe "when called destroy" do
    it "destroy succes" do
      sign_in
      article = create(:article, user: @current_user)
      delete :destroy, params: { id: article.id }
      expect(response).to have_http_status(204)
    end

    it "destroy succes as a admin" do
      admin_sign_in
      article = articles.sample
      delete :destroy, params: { id: article.id }
      expect(response).to have_http_status(204)
    end

    context "when creation is failer" do
      it 'the user is not owner' do
        sign_in
        article = create(:article)
        delete :destroy, params: { id: article.id }
        expect(response).to have_http_status(401)
      end

      it 'as a guest user' do
        delete :destroy, params: { id: articles.sample.id }
        expect(response).to have_http_status(401)
      end
    end
  end
end
