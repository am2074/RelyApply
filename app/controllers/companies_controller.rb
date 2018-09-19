class CompaniesController < ApplicationController
  before_action :set_company, only: [:show, :edit, :update, :destroy,]
   before_action :authenticate_user!, except: [:index, :show, :search]
  # GET /companies
  # GET /companies.json
  def index
      @companies = Company.all
  end

  def search
    if params[:search].blank?
      redirect_to companies_url
      #unhash if you want to see all comapnies
      #companies = Company.all
    else 
      @companies = Company.search(params)
    end
  end

  def list
    @companies = Company.all
  end
  # GET /companies/1
  # GET /companies/1.json
  def show
  end
  
  def show_reviews
  end

  def ranking
    @company = Company.find(params[:id])
  end

  # GET /companies/new
  def new
    @company = Company.new
  end

  # GET /companies/1/edit
  def edit
  end

  # POST /companies
  # POST /companies.json
  def create
    @company = Company.new(company_params)

    respond_to do |format|
      if @company.save
        format.html { redirect_to @company, notice: 'Company was successfully created.' }
        format.json { render :show, status: :created, location: @company }
      else
        format.html { render :new }
        format.json { render json: @company.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /companies/1
  # PATCH/PUT /companies/1.json
  def update
    respond_to do |format|
      if @company.update(company_params)
        format.html { redirect_to @company, notice: 'Company was successfully updated.' }
        format.json { render :show, status: :ok, location: @company }
      else
        format.html { render :edit }
        format.json { render json: @company.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /companies/1
  # DELETE /companies/1.json
  def destroy
    @company.destroy
    respond_to do |format|
      format.html { redirect_to companies_url, notice: 'Company was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_company
      @company = Company.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def company_params
      params.require(:company).permit(:name, :website)
    end
end
