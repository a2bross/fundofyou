class Item < ApplicationRecord
  belongs_to :project
  monetize :budget_cents
  mount_uploader :photo, ItemUploader
end
