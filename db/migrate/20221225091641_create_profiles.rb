class CreateProfiles < ActiveRecord::Migration[7.0]
  def change
    create_table :profiles do |t|
      t.string :title
      t.string :firstname
      t.string :lastname
      t.integer :gender
      t.date :birthday
      t.string :occupation

      t.timestamps
    end
  end
end
