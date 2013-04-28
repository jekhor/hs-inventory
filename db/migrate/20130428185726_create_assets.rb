class CreateAssets < ActiveRecord::Migration
  def change
    create_table :assets do |t|
      t.string :name
      t.integer :category_id
      t.integer :owner_id
      t.integer :user_id
      t.date :date

      t.timestamps
    end
  end
end
