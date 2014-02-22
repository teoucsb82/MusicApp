class UsersController < ApplicationController

	def new
		@user = User.new
		render :new
	end

	def create
		@user = User.new(user_params)
		if @user.save
			UserMailer.welcome_email(@user).deliver!
			# login!(@user)
			flash[:success] = "Thanks for signing up, please click the link in your email to validate your account!"
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
