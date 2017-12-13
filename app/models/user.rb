class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :first_name, :last_name, presence: true
  has_many :donations
  has_many :projects, through: :donations

  def reset_criteria
    self.environment = 0
    self.humanitarian = 0
    self.social = 0
    self.preservation = 0
    self.education = 0
    self.research = 0
    self.local = 0
    self.abroad = 0
  end

  def share(criterium)
    # total amount contributed by user
    sum = 0
    self.donations.each do |donation|
      sum += donation.amount_cents.to_i
    end
    total_donations = sum / 100

    # total amount for selected category
    cat_sum = 0
    self.donations.each do |donation|
      if donation.project[criterium] == 1
        cat_sum += donation.amount_cents.to_i
      end
    end
    total_cat_donations = cat_sum / 100

    return (total_cat_donations * 100) / total_donations

  end
end
