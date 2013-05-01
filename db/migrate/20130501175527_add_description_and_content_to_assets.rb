class AddDescriptionAndContentToAssets < ActiveRecord::Migration
  def change
    add_column :assets, :description, :text
    add_column :assets, :contents, :text
  end
end
