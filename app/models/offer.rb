class Offer < ActiveRecord::Base
  has_many :orders
  validates :name, presence: true
  validates :name, length: { minimum: 2 }
  validates :description, length: { in: 10..200 }
  validates :quantity, numericality: { greater_than: -1 }
  validates :cost, numericality: { greater_than: 0 }
end
