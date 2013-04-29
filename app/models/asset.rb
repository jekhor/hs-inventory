class Asset < ActiveRecord::Base
  attr_accessible :category_id, :date, :name, :owner_id, :user_id, :model, :serial

  belongs_to :category
  belongs_to :owner, :class_name => 'Member', :foreign_key => 'owner_id'
  belongs_to :user, :class_name => 'Member', :foreign_key => 'user_id'


  def inv_no
    sprintf "%02u-%04u", self.category.id, self.id
  end
end
