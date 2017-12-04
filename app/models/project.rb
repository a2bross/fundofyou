class Project < ApplicationRecord
  belongs_to :association
  monetize :price_cents
end
