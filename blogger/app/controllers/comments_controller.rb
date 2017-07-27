class CommentsController < ApplicationController
  include CommentsHelper
  def create
    @comment = Comment.new(comment_params)
    @comment.article_id = params[:article_id]
    @comment.save
    flash.notice = "A Comment by '#{@comment.author_name}' Posted!"
    redirect_to article_path(@comment.article)
  end

  def destroy
    @article = Article.find(params[:id])
    @comment = Comment.find(params[:article_id])
    @comment.destroy
    redirect_to article_path
  end
end
