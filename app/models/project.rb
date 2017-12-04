class Project < ApplicationRecord
  belongs_to :association
  has_many :rewards, dependent: :destroy
  has_many :donations,
  has_many :project_criteria, dependent: :destroy
  has_many :users, through: :donations
  has_many :critieria, through: :project_criteria
  monetize :price_cents
  validates :name, :budget, :start_date, :end_date, :association, presence: true
end
