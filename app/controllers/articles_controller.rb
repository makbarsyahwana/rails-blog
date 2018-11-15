# frozen_string_literal: true

# class for articleController
class ArticlesController < ApplicationController
  # To Get Form of New Article
  def new
    @article = Article.new
  end

  # Index All Article
  def index
    @articles = Article.all
  end

  # Create New Article
  def create
    @article = Article.new(article_params)

    if @article.save
      redirect_to @article
    else
      render 'new'
    end
  end

  # Get Params of Edit Article
  def edit
    @article = Article.find(params[:id])
  end

  # Update Article
  def update
    @article = Article.find(params[:id])

    if @article.update(article_params)
      redirect_to @article
    else
      render 'edit'
    end
  end

  # Show Article
  def show
    @article = Article.find(params[:id])
  end

  # Delete Article
  def destroy
    @article = Article.find(params[:id])
    @article.destroy

    redirect_to articles_path
  end

  # Get Params of Article
  private

  def article_params
    params.require(:article).permit(:title, :text)
  end
end
