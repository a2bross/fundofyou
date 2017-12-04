class Subscription < ApplicationRecord
  belongs_to :user
  has_many :donations
  validates :user, :donation_amount, :subscription_date, presence: true
  monetize :price_cents
end
