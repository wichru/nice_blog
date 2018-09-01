# frozen_string_literal: true

class CommentsController < ApplicationController
  before_action :provide_article, only: %i[create destroy]

  def create
    @comment = Comment.new(comment_params)

    if @comment.save
      redirect_to @article
    else
      render 'articles/show'
    end
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
    params.require(:comment).permit(:commenter, :body).merge(article: @article)
  end
end
