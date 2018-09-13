class ChangeEstimatedWaitTimetoString < ActiveRecord::Migration[5.2]
  def change
  	change_column :reviews, :estimated_wait_time, :string
  end
end
