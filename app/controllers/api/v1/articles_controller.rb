module Api
  module V1
    class ArticlesController < ApiController
      before_action :authenticate_user_from_token!, except: [:index, :show]

      def index
      end

      def show
      end

      def create
      end

      def update
      end

      def destroy
      end
    end
  end
end
