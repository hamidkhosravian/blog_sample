module Api
  module V1
    class AuthenticationsController < ApiController
      include ::OpenApiDocs::Authentications

      def sign_up
        result = Authentications::SignUp.call(params.permit(
            :email,
            :password,
            :confirm_password
        ))
        raise BadRequestError, result.errors if result.failure?

        render json: {response: I18n.t("user.sign_up.successful"), status: 201}, status: :created
      end

      def sign_in
        result = Authentications::SignIn.call(params.permit(
            :email,
            :password
        ))
        raise BadRequestError, result.errors if result.failure?

        @user = result.user
        render "api/v1/users/show", status: :ok
      end
    end
  end
end
