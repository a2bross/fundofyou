class Donation < ApplicationRecord
  belongs_to :project
  belongs_to :user
  belongs_to :order
  monetize :amount_cents
  validates :amount_cents, :project, :user, presence: true
end
