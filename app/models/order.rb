class Order < ApplicationRecord
  has_many :donations
  monetize :amount_cents
  validates :amount_cents, presence: true
  before_create :set_status

  def set_status
    self.status = 1
  end

  def set_project_nb
    update(project_nb: donations.where(status: 20).size) if status == 20
  end

  def self.update_project_nb
    Order.all.each do |order|
      order.set_project_nb
    end
  end
end
