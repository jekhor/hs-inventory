class Asset < ActiveRecord::Base
  include HasBarcode

  attr_accessible :category_id, :date, :name, :owner_id, :user_id, :model, :serial, :description, :contents
  attr_accessible :photo

  belongs_to :category
  belongs_to :owner, :class_name => 'Member', :foreign_key => 'owner_id'
  belongs_to :user, :class_name => 'Member', :foreign_key => 'user_id'

  validates :name, :length => { :maximum => 30 }
  validates :model, :length => { :maximum => 30 }

  has_attached_file :photo,
    :styles => {:medium => "300x300", :thumb => "100x100", :large => "800x600"},
    :url => "/system/:hash.:extension",
    :hash_secret => "hackerspace.by",
    :default_url => "/images/:style/missing.png"

#  has_barcode :barcode,
#    :outputter => :svg,
#    :type => :code_128,
#    :value => Proc.new { |a| a.inv_no }

  require 'barby/barcode/qr_code'
  require 'barby/outputter/svg_outputter'
  def qrcode_data(str)
    qr = Barby::QrCode.new(str, :size => 4, :level => 'q')
    outputter = Barby::SvgOutputter.new(qr)
    outputter.ydim = 5
    outputter.xdim = 5
    outputter.to_svg
  end

  require 'barby/barcode/code_128'
  def barcode_data(*opts)
    barcode = Barby::Code128C.new(self.inv_no_barcode)
    outputter = Barby::SvgOutputter.new(barcode)
    outputter.to_svg(*opts)
  end

  def inv_no
    sprintf "%04u", self.id
  end

  def inv_no_barcode
    sprintf "%04u", self.id
  end
end
