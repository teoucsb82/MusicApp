class UsersController < ApplicationController

	def new
		@user = User.new
		render :new
	end

	def create
		@user = User.new(user_params)

		if @user.save
			login!(@user)
			flash[:success] = "Account successfully created!"
			redirect_to "/"
		else
			flash.now[:error] = @user.errors.full_messages
			render :new
		end
	end

	private
	def user_params
		params.require(:user).permit(:email, :password, :admin, :activated)
	end

end
