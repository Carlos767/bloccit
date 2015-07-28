class CommentsController < ApplicationController
  def index
	  @comments = Comment.all
  end

  def new
  end

  def show
  end

  def _form
  end
  def create
		@post = Post.find(params[:post_id])
	    @comment = Comment.new(comment_params[:id])
	    @comment.user = current_user
	end 
end
