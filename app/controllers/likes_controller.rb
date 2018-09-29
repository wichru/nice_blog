# frozen_string_literal: true

class LikesController < ApplicationController
  before_action :provide_article, only: %i[create destroy]

  def create
    @like = Like.create(user: current_user, article: @article)

    respond_to do |format|
      format.html { redirect_to @article }
      format.js { render layout: false }
    end
  end

  def destroy
    @like = @article.likes.find(params[:id])
    @like.destroy!

    respond_to do |format|
      format.html { redirect_to @article }
      format.js { render layout: false }
    end
  end

  private

  def provide_article
    @article = Article.find(params[:article_id])
  end
end
