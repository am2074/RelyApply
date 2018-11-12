class CreateRequests < ActiveRecord::Migration[5.2]
  def change
    create_table :requests do |t|
      t.integer :company_id
      t.string :name_suggestion
      t.string :website_suggestion

      t.timestamps
    end
    add_index :requests, :company_id
    add_reference :requests, :user, foreign_key: true
  end
end
