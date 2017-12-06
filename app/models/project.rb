class Project < ApplicationRecord
  belongs_to :charity
  has_many :rewards, dependent: :destroy
  has_many :donations
  has_many :users, through: :donations
  monetize :budget_cents
  validates :name, :budget_cents, :start_date, :end_date, :charity, presence: true


  # after_create :define_photo_number

  # def define_photo_number
  #   self.photo = rand(1..5)
  #   self.save
  # end
end
