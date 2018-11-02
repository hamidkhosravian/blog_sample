module Api
  module V1
    class ArticlesController < ApiController
      before_action :authenticate_user_from_token!, except: [:index, :show]
      before_action :find_article, except: [:index, :create]

      def index
        @articles = Article.all
        render "api/v1/articles/index", status: :ok
      end

      def show
        render "api/v1/articles/show", status: :ok
      end

      def create
        result = Articles::Save.call(
          title: params[:title],
          body: params[:body],
          user: @current_user
        );

        raise BadRequestError, result.errors if result.failure?

        @article = result.article
        render "api/v1/articles/show", status: :created
      end

      def update
        result = Articles::Update.call(
          title: params[:title],
          body: params[:body],
          article: @article,
          user: @current_user
        );

        raise BadRequestError, result.errors if result.failure?

        @article = result.article
        authorize @article

        render "api/v1/articles/show", status: :ok
      end

      def destroy
        @article.destroy!
      end

      private
      def find_article
        @article = Article.find(params[:id])
      end
    end
  end
end
