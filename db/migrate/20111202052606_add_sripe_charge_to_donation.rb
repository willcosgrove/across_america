class AddSripeChargeToDonation < ActiveRecord::Migration
  def change
    add_column :donations, :stripe_charge, :string
  end
end
