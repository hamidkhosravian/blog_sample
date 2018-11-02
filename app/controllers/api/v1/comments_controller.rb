module Api
  module V1
    class CommentsController < ApiController
      before_action :authenticate_user_from_token!, except: [:index, :show]
      before_action :find_article
      before_action :find_comment, except: [:index, :create]

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

      private

      def find_article
        @article = Article.find(params[:article_id])
      end

      def find_comment
        @comment = Comment.find(params[:id])
      end
    end
  end
end
