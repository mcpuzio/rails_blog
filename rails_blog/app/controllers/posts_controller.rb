class PostsController < ApplicationController
	def index
		@posts = Post.all
	end

	def show
		@post = Post.find(params[:id])
	end

	def new
		@post = Post.new
	end

	def create
		@post = Post.create(params[:post_id])
	end

	def update
		@post = Post.find(params[:id])
		if @post.update(params[:post])
			@post.save
			flash[:notice] = "Posted successfully!"
			redirect_to @post
		else
			flash[:alert] = "Error; Your post was not successful. Try again."
		end
			redirect_to edit_post_path
	end

	def edit
		@post = Post.find(params[:id])
	end

	def destroy
		@post = Post.find(params[:id])
		if @post.destroy
			flash[:notice] = "This post has been deleted!"
		else
			flash[:alert] = "Error; Post not deleted. Try again."
		end
			redirect_to posts_path
		
	end

end
