class Category < ActiveRecord::Base

  has_many :assets

  attr_accessible :description, :name
end
