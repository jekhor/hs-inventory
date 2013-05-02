class Category < ActiveRecord::Base

  has_many :assets

  attr_accessible :description, :name

  validates :name, :length => { :maximum => 30 }
end
