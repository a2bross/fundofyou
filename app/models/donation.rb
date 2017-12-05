class Donation < ApplicationRecord
  belongs_to :project
  belongs_to :subscription
  belongs_to :user
  monetize :amount_cents
  validates :amount_cents, :execution_date, :project, :user, presence: true
end
