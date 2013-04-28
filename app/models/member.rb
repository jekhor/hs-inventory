class Member < ActiveRecord::Base
  attr_accessible :email, :first_name, :last_name

  def name
    "#{self.first_name} #{self.last_name}"
  end
end
