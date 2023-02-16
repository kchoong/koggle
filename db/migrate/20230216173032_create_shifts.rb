class CreateShifts < ActiveRecord::Migration[7.0]
  def change
    create_table :shifts do |t|
      t.datetime :start_time
      t.datetime :end_time
      t.belongs_to :worker, null: false, foreign_key: true
      t.belongs_to :office, null: true, foreign_key: true

      t.timestamps
    end
  end
end
