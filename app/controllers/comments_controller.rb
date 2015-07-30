class CommentsController < ApplicationController

  def create
		@post = Post.find(params[:post_id])

    @comment = @post.comments.build(comment_params)
    @comment.user = current_user

    #authorize @comment

    if @comment.save
      flash[:notice] = "Comment created successfully"
    else
      flash[:error] = "Comment failed to create."
    end
    redirect_to [@post.topic, @post]
	end 

  def destroy
    @post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:id])

    #authorize @comment
    if @comment.destroy
      flash[:notice] = "Comment deleted successfully"
    else
      flash[:error] = "Comment failed to delete"
    end
    redirect_to [@post.topic, @post]
  end

  private

  def comment_params
    params.require(:comment).permit(:body)
  end
end
