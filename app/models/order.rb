class Order < ApplicationRecord
  has_many :donations
  monetize :amount_cents
  validates :amount_cents, presence: true
  before_create :set_status

  def set_status
    self.status = 1
  end
end
