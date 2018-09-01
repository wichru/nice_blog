# frozen_string_literal: true

class CommentsController < ApplicationController
  before_action :provide_article, only: %i[create destroy]

  def create
    @comment = @article.comments.create(comment_params)

    redirect_to @article
  end

  def destroy
    @comment = @article.comments.find(params[:id])
    @comment.destroy!

    redirect_to @article
  end

  private

  def provide_article
    @article = Article.find(params[:article_id])
  end

  def comment_params
    params.require(:comment).permit(:commenter, :body)
  end
end
