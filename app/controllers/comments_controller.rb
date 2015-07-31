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
     def destroy
     @post = Topic.find(params[:topic_id])
     @post = @topic.posts.find(params[:post_id])
     @comment = @post.comments.find(params[:id])
 
     authorize @comment
     if @comment.destroy
       flash[:notice] = "Comment was removed."
       redirect_to [@post]
     else
       flash[:error] = "Comment couldn't be deleted. Try again."
       redirect_to [@post]
     end
   end


  private

  def comment_params
    params.require(:comment).permit(:body)
  end
end
