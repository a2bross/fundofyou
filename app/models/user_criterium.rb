class UserCriterium < ApplicationRecord
  belongs_to :criteria
  belongs_to :user
end
