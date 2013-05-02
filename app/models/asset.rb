class Asset < ActiveRecord::Base
  include HasBarcode

  attr_accessible :category_id, :date, :name, :owner_id, :user_id, :model, :serial, :description, :contents

  belongs_to :category
  belongs_to :owner, :class_name => 'Member', :foreign_key => 'owner_id'
  belongs_to :user, :class_name => 'Member', :foreign_key => 'user_id'

  validates :name, :length => { :maximum => 60 }
  validates :model, :length => { :maximum => 60 }

  has_barcode :barcode,
    :outputter => :svg,
    :type => :code_128,
    :value => Proc.new { |a| a.inv_no }

  require 'barby/barcode/qr_code'
  require 'barby/outputter/svg_outputter'
  def qrcode_data(str)
    qr = Barby::QrCode.new(str, :size => 4, :level => 'q')
    outputter = Barby::SvgOutputter.new(qr)
    outputter.ydim = 5
    outputter.xdim = 5
    outputter.to_svg
  end


  def inv_no
    sprintf "%02u-%04u", self.category.id, self.id
  end
end
