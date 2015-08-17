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
 
     authorize @comment
     if @comment.destroy
       flash[:notice] = "Comment was removed."
     else
       flash[:error] = "Comment couldn't be deleted. Try again."
     end
     
     respond_to do |format|
      format.html
      format.js
    end
   end


  private

  def comment_params
    params.require(:comment).permit(:body)
  end
end
