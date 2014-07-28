class Order < ActiveRecord::Base
  belongs_to :offer
  validates :quantity, numericality: { greater_than: 0 }
  validates :offer, presence: true
end
