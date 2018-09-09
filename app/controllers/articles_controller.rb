# frozen_string_literal: true

class ArticlesController < ApplicationController
  before_action :provide_article, only: %i[show edit update destroy]
  before_action :check_article_owner, only: %i[edit update]

  def index
    @articles = Article.all.order(created_at: :desc)
                      .includes(:user)
                      .paginate(page: params[:page], per_page: 15)

    @articles = @articles.where('? = any(tags)', params[:q]) if params[:q].present?
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)

    if @article.save
      redirect_to @article
    else
      render 'new'
    end
  end

  def show
    @comment = Comment.new(article: @article, commenter: session[:commenter])
    @like = @article.likes.find_by(user: current_user)
  end

  def edit; end

  def update
    if @article.update(article_params)
      redirect_to @article
    else
      render 'edit'
    end
  end

  def destroy
    @article.destroy!

    redirect_to articles_path
  end

  private

  def check_article_owner
    redirect_to articles_path if @article.user != current_user
  end

  def provide_article
    @article = Article.find(params[:id])
  end

  def article_params
    params.require(:article).permit(:title, :text, :tags).merge(user: current_user)
  end
end
