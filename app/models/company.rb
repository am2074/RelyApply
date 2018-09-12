class Company < ApplicationRecord
	has_many :reviews

	def self.search(params)
		companies = Company.where("name LIKE ? or website LIKE ?", "%#{params[:search]}%", "%#{params[:search]}%") if params[:search].present?
	end
end
