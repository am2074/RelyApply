class ChangeColumnNull < ActiveRecord::Migration[5.2]
  def change
  	change_column_null(:reviews, :satisfaction, false)
  end
end
