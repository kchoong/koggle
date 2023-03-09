class CreateAdminShiftCorrections < ActiveRecord::Migration[7.0]
  def change
    create_table :admin_shift_corrections do |t|
      t.string :description

      t.timestamps
    end
  end
end
