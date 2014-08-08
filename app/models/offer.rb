class Offer < ActiveRecord::Base
  has_many :orders

  has_attached_file :image, :styles => { :medium => "500x500>", :thumb => "100x100>" },
  :default_url => "/images/missing.png"

  validates_attachment :image,
  :content_type => { :content_type => ["image/jpeg", "image/gif", "image/png"] },
  :size => { :in => 1..800.kilobytes }

  validates :name, presence: true
  validates :name, length: { minimum: 2 }
  validates :description, length: { in: 10..200 }
  validates :quantity, numericality: { greater_than: -1 }
  validates :cost, numericality: { greater_than: 0 }
end
