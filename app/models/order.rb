class Order < ApplicationRecord
  has_many :donations
  monetize :amount_cents
  validates :amount_cents, presence: true
end
