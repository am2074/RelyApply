class AddResponsivenessToOffers < ActiveRecord::Migration[5.2]
  def change
    add_column :offers, :responsiveness, :string
  end
end
