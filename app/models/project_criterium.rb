class ProjectCriterium < ApplicationRecord
  belongs_to :criterium
  belongs_to :project
  validates :value, :criterium, :project, presence: true
  validates :criterium, uniqueness: { scope :project }
end
