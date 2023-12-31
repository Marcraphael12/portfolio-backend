class Api::V1::ArticlesController < ApplicationController
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

  private

  def article_params
    params.require(:article).permit(:title, :image, :description)
  end
end

# t.string 'title'
# t.string 'image'
# t.string 'description'
