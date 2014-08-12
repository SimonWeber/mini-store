class Order < ActiveRecord::Base
  belongs_to :offer
  validates :quantity, numericality: { greater_than: 0 }
  validates :offer, presence: true
  validates :lastname, presence: true, length: { minimum: 2 }
  validates :street, presence: true
  validates :zip, presence: true, length: { is: 5 }
  validates :city, presence: true
  validates :telephone, length: { in: 6..30 }, presence: true, if: :without_email?
  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i

  def without_email?
    self.email.blank?
  end
end
