class UserCriterium < ApplicationRecord
  belongs_to :criterium
  belongs_to :user
  validates :value, :criterium, :user, presence: true
  validates :criterium, uniqueness: { scope :user }
end
