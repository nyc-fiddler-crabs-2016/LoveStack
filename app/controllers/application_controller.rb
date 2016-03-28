class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :logged_in?, except: [:index, :show]

  helper_method :current_user, :author?, :asker?


  def current_user
  	User.find(session[:user_id]) if session[:user_id]
  end

  def author?(answer)
    current_user && (current_user.id == answer.user_id)
  end

  def asker?(question)
    current_user && (current_user.id == question.user_id)
  end


  private

  def logged_in?
  	unless !!current_user
  		flash.alert = "Please Log In"
  		render '/sessions/new'
  	end
  end

end
