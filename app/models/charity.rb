class Charity < ApplicationRecord
  validates :name, :email, :description, presence: true
  has_many :projects, dependent: :destroy
  mount_uploader :photo, CharityUploader
end
