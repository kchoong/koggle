class AddIndexToShifts < ActiveRecord::Migration[7.0]
  def change
    add_index :shifts, :start_time
    add_index :shifts, :end_time
  end
end
