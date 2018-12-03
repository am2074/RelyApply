class Offer < ApplicationRecord
	default_scope { order(created_at: :desc) }
	belongs_to :user
	belongs_to :company
	acts_as_votable
	geocoded_by :address
	after_validation :geocode, :if => :address_changed?
	scope :latest, -> { where(created_at: 60.days.ago..DateTime.now.end_of_day) }
	validates_presence_of :response_time, :satisfaction, :responsiveness
end
