class CreatePersons < ActiveRecord::Migration[7.0]
  def change
    create_table :persons do |t|
      t.string :title
      t.string :firstname
      t.string :lastname
      t.integer :gender, default: 0
      t.date :birthday
      t.string :profession

      t.timestamps
    end
  end
end
