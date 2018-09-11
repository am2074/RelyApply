class CreateReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|
      t.string :position
      t.string :employment_type
      t.string :satisfaction

      t.timestamps
    end
  end
end
