class UsersController < ApplicationController
before_action :authenticate_user!
before_action :set_user
 
  def show 
  end

  def user_reviews
  end


private 
	def set_user
		@users= current_user
	end 

	
end
