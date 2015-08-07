class FavoritesController < ApplicationController
def create
	post = Post.find(params[:post_id])
	favorite = current_user.favorites.build(post: post)

	if favorite.save
     	@post.add_favorite
     		flash[:notice] = "Favorite was added!"
     		redirect_to [post.topic, post]
     	else
     		flash[:error] = "There was an error adding your favorite. Please try again."
     		render :new
     	end
    end

    def destroy
    	@post = Post.find(params[:post_id])
    	@favorite = Favorite.find(params[:id])
    	authorize @favorite

    	if favorite.destroy
    		flash[:notice] = "This post is not a favorite anymore."
    		redirect_to @post
    	else
    		flash[:error] = "There was an error, please try again."
    		render :show
    	end
    end
end



