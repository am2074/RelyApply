class Flag < ApplicationRecord
  belongs_to :user
  belongs_to :review

  flags = Flag.includes(:review).uniq
	flags.each do |flag|
    	puts flag.review
	end
end