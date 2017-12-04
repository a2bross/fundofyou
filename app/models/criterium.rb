class Criterium < ApplicationRecord
  validates :name, presence: true
  has_many :project_criteria, dependent: :destroy
  has_many :user_criteria, dependent: :destroy
end
