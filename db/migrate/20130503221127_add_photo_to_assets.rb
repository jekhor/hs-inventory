class AddPhotoToAssets < ActiveRecord::Migration
  def change
    add_attachment :assets, :photo
  end
end
