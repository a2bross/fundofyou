class Subscription < ApplicationRecord
  belongs_to :user
  has_many :donations
  validates :user, :amount_cents, :subscription_date, presence: true
  monetize :amount_cents
end
