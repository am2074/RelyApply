class ReviewsController < ApplicationController
  load_and_authorize_resource
  before_action :set_review, only: [:show, :edit, :update, :destroy, :upvote, :downvote]
  before_action :company_friendly_params, only: [:index, :new, :create]
  before_action :authenticate_user!, except: [:index, :show]

  # GET /reviews
  # GET /reviews.json
  def index
    @reviews = Review.where(company_id: params[:company_id]) 
    if params[:search].present?
      @q = @company.reviews.near(params[:search], 200, :order => 'distance' ).ransack(params[:q])
      @reviews = @q.result(:distinct => true).includes(:company)
    else 
      @q = @company.reviews.ransack(params[:q])
      @reviews = @q.result(:distinct => true).includes(:company)
    end
  end


  # GET /reviews/1
  # GET /reviews/1.json
  def show
     @graph = Reviews.all
  end

  # GET /reviews/new
  def new
    @review = Review.new
  end

  # GET /reviews/1/edit
  def edit
     
  end

  # POST /reviews
  # POST /reviews.json
  def create
    @review = @company.reviews.new(review_params)
    @review.user = current_user

    respond_to do |format|
      if @review.save
        format.html { redirect_to @company, notice: 'Review was successfully created.' }
        format.json { render :show, status: :created, location: @review }
      else
        format.html { render :new }
        format.json { render json: @review.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /reviews/1
  # PATCH/PUT /reviews/1.json
  def update
    respond_to do |format|
      if @review.update(review_params)
        format.html {  redirect_to @review.user, notice: 'Review was successfully updated.' }
        format.json { render :show, status: :ok, location: @review }
      else
        format.html { render :edit }
        format.json { render json: @review.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /reviews/1
  # DELETE /reviews/1.json
  def destroy
    @review.destroy
    respond_to do |format|
      format.html { redirect_back fallback_location: root_path, notice: 'Review was successfully deleted.' }
      format.json { head :no_content }
    end
  end

  def upvote
    @review.upvote_by current_user
    redirect_back fallback_location: root_path
  end

  def downvote
    @review.downvote_by current_user
    redirect_back fallback_location: root_path.hash
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_review
      @review = Review.find(params[:id].to_i)
    end

    # Never trust parameters from the scary internet, only allow the white list through.
     def review_params
      params.require(:review).permit(:review_id, :position, :employment_type, :satisfaction, :company_id, :user_id,:response_time, :application_type, :street_number, :company_id, :address, :locality, :route, :administrative_area_level_1, :country, :postal_code)
    end

    def company_friendly_params
       @company = Company.friendly.find(params[:company_id])
    end 
end
