class Project < ApplicationRecord
  belongs_to :charity
  has_many :rewards, dependent: :destroy
  has_many :donations,
  has_many :users, through: :donations
  monetize :price_cents
  validates :name, :budget, :start_date, :end_date, :charity, presence: true
end
