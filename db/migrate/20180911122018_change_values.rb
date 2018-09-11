class ChangeValues < ActiveRecord::Migration[5.2]
  def change
  	change_column_default :reviews, :satisfaction, 0 
  end
end
