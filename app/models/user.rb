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
end
