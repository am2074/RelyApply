class Company < ApplicationRecord
	extend FriendlyId
  friendly_id :name, use: :slugged
	has_many :reviews
	has_many :requests
	has_many :offers
	validates_presence_of :name, :website
	validates_uniqueness_of :name, :case_sensitive => false
	validates :website, url: true
	
	def self.search(params)
		companies = Company.where("name iLIKE ? or website iLIKE ?", "%#{params[:search]}%", "%#{params[:search]}%") if params[:search].present?
	end

	def company_name
		company.try(:name)
	end

	def company_name=(name)
		self.company = Company.find_by_name(name) if name.present?
	end
end
