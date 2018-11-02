require 'rails_helper'

RSpec.describe Api::V1::CommentsController, type: :controller do
  let!(:article) { create(:article) }
  let!(:comments) { create_list(:comment, 3, article: article) }

  context "when called index" do
    it 'as a user' do
      sign_in
      get :index, params: {article_id: article.id}
      expect(response).to have_http_status(200)
      expect(JSON.parse(response.body)).to have_key("comments")
      expect(JSON.parse(response.body)["comments"].size).to eq 3
    end

    it 'as a guest' do
      get :index, params: {article_id: article.id}
      expect(response).to have_http_status(200)
      expect(JSON.parse(response.body)).to have_key("comments")
      expect(JSON.parse(response.body)["comments"].size).to eq 3
    end
  end

  context "when called show" do
    it 'as a user' do
      sign_in
      comment = comments.sample
      get :show, params: { id: comment.id, article_id: article.id }
      expect(response).to have_http_status(200)
      expect(JSON.parse(response.body)["id"]).to eq comment.id
    end

    it 'as a guest' do
      comment = comments.sample
      get :show, params: { id: comment.id, article_id: article.id }
      expect(response).to have_http_status(200)
      expect(JSON.parse(response.body)["id"]).to eq comment.id
    end

    it 'could not found comment' do
      get :show, params: { id: 'invalid', article_id: article.id }
      expect(response).to have_http_status(404)
    end
  end

  describe "when called create" do
    it "create succes" do
      sign_in
      post :create, params: FactoryBot.attributes_for(:comment).merge(article_id: article.id)
      expect(response).to have_http_status(201)
    end

    context "when creation is failer" do
      it 'without body' do
        sign_in
        post :create, params: FactoryBot.attributes_for(:comment, body: nil).merge(article_id: article.id)
        expect(response).to have_http_status(400)
      end

      it 'as a guest user' do
        post :create, params: FactoryBot.attributes_for(:comment, body: nil).merge(article_id: article.id)
        expect(response).to have_http_status(401)
      end
    end
  end

  describe "when called update" do
    it "update succes" do
      sign_in
      comment = create(:comment, user: @current_user)
      put :update, params: { id: comment.id, article_id: article.id, body: 'body' }
      expect(response).to have_http_status(200)
      expect(JSON.parse(response.body)["id"]).to eq comment.id
    end

    it "update succes as a admin" do
      admin_sign_in
      comment = comments.sample
      put :update, params: { id: comment.id, article_id: article.id, body: 'body' }
      expect(response).to have_http_status(200)
      expect(JSON.parse(response.body)["id"]).to eq comment.id
    end

    context "when creation is failer" do
      it 'the user is not owner' do
        sign_in
        comment = create(:comment)
        put :update, params: { id: comment.id, article_id: article.id }
        expect(response).to have_http_status(401)
      end

      it 'as a guest user' do
        put :update, params: { id: comments.sample.id, article_id: article.id }
        expect(response).to have_http_status(401)
      end
    end
  end

  describe "when called destroy" do
    it "destroy succes" do
      sign_in
      comment = create(:comment, user: @current_user)
      delete :destroy, params: { id: comment.id, article_id: article.id }
      expect(response).to have_http_status(204)
    end

    it "destroy succes as a admin" do
      admin_sign_in
      comment = comments.sample
      delete :destroy, params: { id: comment.id, article_id: article.id }
      expect(response).to have_http_status(204)
    end

    context "when creation is failer" do
      it 'the user is not owner' do
        sign_in
        comment = create(:comment)
        delete :destroy, params: { id: comment.id, article_id: article.id }
        expect(response).to have_http_status(401)
      end

      it 'as a guest user' do
        delete :destroy, params: { id: comments.sample.id, article_id: article.id }
        expect(response).to have_http_status(401)
      end
    end
  end
end
