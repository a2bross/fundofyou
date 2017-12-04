class Reward < ApplicationRecord
  belongs_to :project
  validates :minimum_donation, :description, :project, presence: true
end
