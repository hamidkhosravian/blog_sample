module Api
  module V1
    class ApiController < ApplicationController

      protected

      # authenticate user from Authorization in header with exception
      def authenticate_user_from_token!
        result = find_user
        raise BadRequestError, result.errors if result.failure?
        @current_user = result.current_user
      end

      # authenticate user from Authorization in header without exception
      def authenticate_user_from_token
        result = find_user
        @current_user = result.current_user
      end

      # we use this method for pundit
      def current_user
        @current_user
      end

      private

      def find_user
        raise AuthorizationError unless http_auth_token.present?
        result = Authentications::Authenticate.call(auth_token: http_auth_token)
      end

      # get token from Authorization in header
      def http_auth_token
        auth_token = request.env["HTTP_AUTHORIZATION"]
        auth_token.split(" ").last if auth_token.present? && auth_token.split(" ").first.downcase == "bearer"
      end
    end
  end
end
