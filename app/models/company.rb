class Company < ApplicationRecord
	extend FriendlyId
  	friendly_id :name, use: :slugged
	has_many :reviews
	validates_presence_of :name, :website
	validates_uniqueness_of :name, :case_sensitive => false
	def self.search(params)
		companies = Company.where("name iLIKE ? or website iLIKE ?", "%#{params[:search]}%", "%#{params[:search]}%") if params[:search].present?
		
	end
end
#Old #companies = Company.where("name LIKE ? or website LIKE ?", "%#{params[:search]}%", "%#{params[:search]}%") if params[:search].present?