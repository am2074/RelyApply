class RemoveSatisfactionFromCompanies < ActiveRecord::Migration[5.2]
  def change
    remove_column :reviews, :satisfaction, :string
  end
end
