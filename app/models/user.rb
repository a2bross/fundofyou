class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :first_name, :last_name, presence: true
  has_many :user_criteria, dependent: :destroy
  has_many :criteria, through: :user_criteria
  has_many :donations
  has_many :projects, through: :donations
end
