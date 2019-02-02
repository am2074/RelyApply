class CreateFlags < ActiveRecord::Migration[5.2]
  def change
    create_table :flags do |t|
      t.belongs_to :user, null: false
      t.belongs_to :review, null: false
      t.timestamps
    end
    add_index :flags, [:user_id, :review_id], unique: true
  end
end
