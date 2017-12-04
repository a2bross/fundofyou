class Donation < ApplicationRecord
  belongs_to :project
  belongs_to :subscription
  belongs_to :user
  monetize :price_cents
end
