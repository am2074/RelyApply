class UsersController < ApplicationController
before_action :authenticate_user!
before_action :set_user

def show 
  @users= User.find(params[:id])
end

def user_reviews
  @users= User.find(params[:id])
end

private 

def set_user
	@users= User.find(params[:id])
end 

end
