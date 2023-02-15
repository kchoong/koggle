class CreateOffices < ActiveRecord::Migration[7.0]
  def change
    create_table :offices do |t|
      t.string :name
      t.string :description
      t.string :address_1
      t.string :address_2
      t.string :postcode
      t.string :city
      t.string :country

      t.timestamps
    end
  end
end
