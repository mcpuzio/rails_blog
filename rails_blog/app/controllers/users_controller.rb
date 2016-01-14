class UsersController < ApplicationController
	def index
		@users = User.all
	end

	def show
		@user = User.find(params[:id])
	end

	def create
		@user = User.create(params[:username])
		redirect_to @user
	end

	def new
		@user = User.new
	end

	def edit
		@user = User.find(params[:id])
	end

	def update
		@user = User.find(params[:id])
		if @user.update(params[:username])
			@user.save
			flash[:notice] = "Your profile is updated!"
			redirect_to @user
		else
			flash[:alert] = "Your profile was not updated."
			redirect_to edit_user_path		
		end
	end

	def destroy
		@user = User.find(params[:id])
		if @user.destroy
			flash[:notice] = "Profile has been deleted."
  		else
  			flash[:alert] = "Error; Profile was not deleted."
  		end
			redirect_to users_path
		end
	end

