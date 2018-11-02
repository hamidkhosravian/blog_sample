module Api
  module V1
    class CommentsController < ApiController
      before_action :authenticate_user_from_token!, except: [:index, :show]
      before_action :find_article
      before_action :find_comment, except: [:index, :create]

      def index
        @comments = Comment.all
        render "api/v1/comments/index", status: :ok
      end

      def show
        render "api/v1/comments/show", status: :ok
      end

      def create
        result = Comments::Save.call(
          title: params[:title],
          body: params[:body],
          article: @article,
          user: @current_user
        );

        raise BadRequestError, result.errors if result.failure?

        @comment = result.comment
        render "api/v1/comments/show", status: :created
      end

      def update
        result = Comments::Update.call(
          title: params[:title],
          body: params[:body],
          comment: @comment,
          article: @article,
          user: @current_user
        );

        raise BadRequestError, result.errors if result.failure?

        @comment = result.comment
        authorize @article

        render "api/v1/comments/show", status: :ok
      end

      def destroy
        authorize @comment
        @comment.destroy!
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
