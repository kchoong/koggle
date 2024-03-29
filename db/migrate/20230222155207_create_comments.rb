class CreateComments < ActiveRecord::Migration[7.0]
  def change
    create_table :comments do |t|
      t.string :author
      t.string :text
      t.references :commentable, polymorphic: true, null: false

      t.timestamps
    end
  end
end
