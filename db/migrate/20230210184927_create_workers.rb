class CreateWorkers < ActiveRecord::Migration[7.0]
  def change
    create_table :workers do |t|
      t.string :first_name
      t.string :last_name
      t.date :birthday
      t.string :address_1
      t.string :address_2
      t.string :postcode
      t.string :city
      t.string :country
      t.integer :work_hours
      t.integer :vacation_days

      t.references :user, index: true
      t.references :office, index: true

      t.timestamps
    end
  end
end
