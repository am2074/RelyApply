class OffersController < ApplicationController
  before_action :set_offer, only: [:show, :edit, :update, :destroy, :upvote, :downvote]
  before_action :company_friendly_params, only: [:index, :new, :create]
  before_action :authenticate_user!, except: [:index, :show]

  # GET /offers
  # GET /offers.json
  def index
     @offers = Offer.where(company_id: params[:company_id]) 
    if params[:search].present?
      @q = @company.offers.near(params[:search], 200, :order => 'distance' ).ransack(params[:q])
      @offers = @q.result(:distinct => true)
    else 
      @q = @company.offers.ransack(params[:q])
      @offers = @q.result(:distinct => true)
    end
  end

  # GET /offers/1
  # GET /offers/1.json
  def show
  end

  # GET /offers/new
  def new
    @offer = Offer.new
  end

  # GET /offers/1/edit
  def edit
  end

  # POST /offers
  # POST /offers.json
  def create
    @offer = @company.offers.new(offer_params)
    @offer.user = current_user

    respond_to do |format|
      if @offer.save
        format.html { redirect_to @company, notice: 'Review was successfully created.' }
        format.json { render :show, status: :created, location: @offer }
      else
        format.html { render :new }
        format.json { render json: @offer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /offers/1
  # PATCH/PUT /offers/1.json
  def update
    respond_to do |format|
      if @offer.update(offer_params)
        format.html { redirect_to @offer.user, notice: 'Review was successfully updated.' }
        format.json { render :show, status: :ok, location: @offer }
      else
        format.html { render :edit }
        format.json { render json: @offer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /offers/1
  # DELETE /offers/1.json
  def destroy
    @offer.destroy
    respond_to do |format|
      format.html { redirect_back fallback_location: root_path, notice: 'Reivew was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
  def upvote
   if !current_user.liked? @offer
      @offer.upvote_by current_user
    elsif current_user.liked? @offer
      @offer.unliked_by current_user
    end
    #redirect_back fallback_location: root_path
    respond_to do |format|
      format.html { redirect_back fallback_location: root_path}
      format.json { render json: { count: @offer.upvoted_count } }
      format.js { render layout: false }
    end
  end

  def downvote 
    if !current_user.disliked? @offer
      @offer.downvote_by current_user
    elsif current_user.disliked? @offer
      @offer.undisliked_by current_user
    end
    respond_to do |format|
      format.html { redirect_back fallback_location: root_path }
      format.json { render json: { count: @offer.downvoted_count } }
      format.js { render layout: false }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_offer
      @offer = Offer.find(params[:id].to_i)
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def offer_params
      params.require(:offer).permit(:offer_id, :user_id, :company_id, :position, :employment_type, :responsiveness, :experience, :response_time, :address, :latitude, :longitude, :street_number, :locality, :route, :administrative_area_level_1, :country, :postal_code)
    end

    def company_friendly_params
       @company = Company.friendly.find(params[:company_id])
    end 
end
