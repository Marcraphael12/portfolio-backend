# frozen_string_literal: true

module Api
  module V1
    class ArticlesController < ApplicationController
      def create
        author = User.find(params[:user_id])
        article = author.articles.new(article_params)
        # article = Article.new(article_params)
        if article.save
          # session[:article_id] = @article.id
          render json: article, status: :created
        else
          render json: article.errors, status: :unprocessable_entity
        end
      end

      def index
        articles = Article.where(user_id: params[:user_id])

        if articles.empty?
          render json: 'user without article'
        else
          render json: articles
        end
      end

      def show
        article = Article.find(params[:id])
        render json: article
      end

      def destroy
        article = Article.find(params[:id])
        article.destroy
        render json: { message: 'article successfully destroyed' }, status: :ok
      end

      private

      def article_params
        params.require(:article).permit(:title, :image, :description)
      end
    end
  end
end

# t.string 'title'
# t.string 'image'
# t.string 'description'
