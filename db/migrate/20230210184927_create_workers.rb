class CreateWorkers < ActiveRecord::Migration[7.0]
  def change
    create_table :workers do |t|
      t.string :first_name
      t.string :last_name
      t.date :birthday
      t.string :address_1
      t.string :address_2
      t.string :city
      t.string :country
      t.string :postcode
      t.integer :work_hours
      t.integer :vacation_days

      t.timestamps
    end
  end
end
