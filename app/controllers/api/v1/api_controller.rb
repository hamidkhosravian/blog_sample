module Api
  module V1
    class ApiController < ApplicationController

      protected

      def authenticate_user_from_token!
        result = Authentications::Authenticate.call(auth_token: http_auth_token)
        raise BadRequestError, result.errors if result.failure?
        @current_user = result.current_user
      end

      private

      # get token from Authorization in header
      def http_auth_token
        auth_token = request.env["HTTP_AUTHORIZATION"]
        auth_token.split(" ").last if auth_token.present? && auth_token.split(" ").first.downcase == "bearer"
      end
    end
  end
end
