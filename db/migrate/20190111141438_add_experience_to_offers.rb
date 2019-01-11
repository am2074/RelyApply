class AddExperienceToOffers < ActiveRecord::Migration[5.2]
  def change
    add_column :offers, :experience, :string
  end
end
