class CreateProfiles < ActiveRecord::Migration[7.0]
  def change
    create_table :profiles do |t|
      t.string :title
      t.string :firstname
      t.string :lastname
      t.integer :gender
      t.date :birthday
      t.string :occupation
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
