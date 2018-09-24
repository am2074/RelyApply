class Review < ApplicationRecord
	belongs_to :user
	belongs_to :company
	acts_as_votable
end
