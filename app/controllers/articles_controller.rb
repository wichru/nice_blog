# frozen_string_literal: true

class ArticlesController < ApplicationController
  before_action :provide_article, only: %i[show edit update destroy]

  def index
    @articles = Article.all.order(created_at: :desc)
                      .includes(:user)
                      .paginate(page: params[:page], per_page: 15)

    @articles = @articles.where('? = any(tags)', params[:q]) if params[:q].present?

    respond_to do |format|
      format.html
      format.js { render layout: false }
    end
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

  def edit
    authorize @article
  end

  def update
    authorize @article

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

  def provide_article
    @article = Article.find(params[:id])
  end

  def article_params
    params.require(:article).permit(:title, :text, :tags, :image).merge(user: current_user)
  end
end
