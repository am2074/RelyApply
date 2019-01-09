class AddOffersCounterToCompanies < ActiveRecord::Migration[5.2]
  def change
    add_column :companies, :offers_count, :integer, :default => 0, null: :false
  end

  def up
    Company.find_each do |company|
      Company.reset_counters(company.id, :offers)
    end
  end
end
