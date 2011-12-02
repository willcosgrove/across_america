class CreateDonations < ActiveRecord::Migration
  def change
    create_table :donations do |t|
      t.string :name
      t.integer :value_in_pennies
      t.boolean :processed
      t.text :note
      t.string :email

      t.timestamps
    end
  end
end
