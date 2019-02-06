class AddOfferToOffers < ActiveRecord::Migration[5.2]
  def change
    add_column :offers, :offer, :string
  end
end
