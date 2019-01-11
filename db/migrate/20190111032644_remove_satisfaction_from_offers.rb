class RemoveSatisfactionFromOffers < ActiveRecord::Migration[5.2]
  def change
    remove_column :offers, :satisfaction, :string
  end
end
