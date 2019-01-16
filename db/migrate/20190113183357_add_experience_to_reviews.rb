class AddExperienceToReviews < ActiveRecord::Migration[5.2]
  def change
    add_column :reviews, :experience, :string
  end
end
