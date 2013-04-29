class AddModelAndSerialToAsset < ActiveRecord::Migration
  def change
    add_column :assets, :model, :string
    add_column :assets, :serial, :string
  end
end
