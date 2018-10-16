class Review < ApplicationRecord
	default_scope { order(created_at: :desc) }
	belongs_to :user
	belongs_to :company
	acts_as_votable
	geocoded_by :address
	after_validation :geocode, :if => :address_changed?
 	
end
