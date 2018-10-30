require 'rails_helper'

RSpec.describe Api::V1::AuthenticationsController, type: :controller do
  describe "when user sign up" do
    it "with valid data" do
      post :sign_up, params: FactoryBot.attributes_for(:valid_user_register)
      expect(response).to have_http_status(201)
    end

    context "when invalid data" do
      it "with invalid password length" do
        post :sign_up, params: FactoryBot.attributes_for(:valid_user_register, password: '123')
        res = JSON.parse(response.body)
        expect(response).to have_http_status(400)
        expect(res["response"]).to include(I18n.t("user.sign_up.errors.password_length"))
      end

      it "without confirm_passowrd" do
        post :sign_up, params: FactoryBot.attributes_for(:user)
        res = JSON.parse(response.body)
        expect(response).to have_http_status(400)
        expect(res["response"]).to include("Confirm password can't be blank")
      end

      it "with not equal password and confirm_passowrd" do
        post :sign_up, params: FactoryBot.attributes_for(:valid_user_register, confirm_password: '123456aa')
        res = JSON.parse(response.body)
        expect(response).to have_http_status(400)
        expect(res["response"]).to include(I18n.t("user.sign_up.errors.confirm_password"))
      end
    end
  end

  describe "when user sign in" do
    let!(:user_attributes) { FactoryBot.attributes_for(:valid_user_register) }

    before(:each) do
      post :sign_up, params: user_attributes
      expect(response).to have_http_status(201)
    end

    it "with valid data" do
      post :sign_in, params: user_attributes
      res = JSON.parse(response.body)

      expect(response).to have_http_status(200)
      expect(res["email"]).to eq(user_attributes[:email])
    end

    context "when invalid data" do
      it 'with non exist email' do
        post :sign_in, params: FactoryBot.attributes_for(:valid_user_register)
        res = JSON.parse(response.body)

        expect(response).to have_http_status(404)
        expect(res["response"]).to include(I18n.t("user.sign_in.errors.not_found"))
      end
      it 'with wrong password' do
        post :sign_in, params: { email: user_attributes[:email], password: 'invalid' }
        res = JSON.parse(response.body)

        expect(response).to have_http_status(400)
        expect(res["response"]).to include(I18n.t("user.sign_in.errors.invalid_password"))
      end
    end
  end
end
