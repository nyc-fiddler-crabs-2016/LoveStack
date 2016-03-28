class UsersController < ApplicationController

	skip_before_action :logged_in?

	def new
		@user = User.new
	end

	def create
		@user = User.new(user_params)

		if @user.save
			redirect_to '/'
		else
			flash[:notice] = "You did something wrong"
			render "/users/new"
		end
	end


	def show
		@user = User.find(params[:id])
		@questions = @user.questions
	end


	private

	def user_params
		params.require(:user).permit(:email, :password)
	end

end
