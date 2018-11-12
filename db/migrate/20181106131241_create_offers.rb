class CreateOffers < ActiveRecord::Migration[5.2]
  def change
    create_table :offers do |t|
      t.string  :position
      t.string  :employment_type
      t.string  :satisfaction
      t.string  :response_time
      t.integer :company_id
      t.string  :address
      t.float   :latitude
      t.float   :longitude
      t.string  :street_number
      t.string  :locality
      t.string  :route
      t.string  :administrative_area_level_1
      t.string  :country
      t.integer :postal_code

      t.timestamps
    end
    add_index :offers, :company_id
    add_reference :offers, :user, foreign_key: true
  end
end
