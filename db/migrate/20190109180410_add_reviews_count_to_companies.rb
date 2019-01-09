class AddReviewsCountToCompanies < ActiveRecord::Migration[5.2]
  def change
    add_column :companies, :reviews_count, :integer, :default => 0, null: :false
  end


  def up
    Company.find_each do |company|
      Company.reset_counters(company.id, :reviews)
    end
  end
end
