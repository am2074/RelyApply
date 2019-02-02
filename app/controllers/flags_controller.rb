class FlagsController < ApplicationController
  before_action :set_flag
  before_action :authenticate_user!

  def new
    @flag = Flag.new
  end

  def create
    @flag = Flag.new(flag_params)
    if @flag.save 
      respond_to do |format|
        redirect_back fallback_location: root_path, notice: 'WOMP WOMP' 
      end
    else
      format.json { render json: @flag.errors, status: :unprocessable_entity }
    end
  end

  private 
  def set_request
    @flag = Flag.find(params[:id])
  end
  
  def flag_params
    params.require(:flag).permit(:user_id, :review_id)
  end
end