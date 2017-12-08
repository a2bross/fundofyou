class Project < ApplicationRecord
  belongs_to :charity
  has_many :rewards, dependent: :destroy
  has_many :donations, dependent: :destroy
  has_many :users, through: :donations
  monetize :budget_cents
  validates :name, :budget, :description, :start_date, :end_date, :charity, presence: true
  mount_uploader :photo, ProjectUploader


  # after_create :define_photo_number

  # def define_photo_number
  #   self.photo = rand(1..5)
  #   self.save
  # end

  def self.recommendation (user, number_of_recommendations)
    recommendations = [
      # {
      # project_id: project.id,
      # score: score
      # },
    ]

    projects = self.all

    valid_projects = projects.select{ |project| ((project[:status] == 10) && (project[:completion_rate] < 100)) }

    sorted_valid_projects = valid_projects.sort_by{ |project| [project.score(user), project[:completion_rate]] }

    sorted_valid_projects.last(number_of_recommendations).each do |project|
      recommendations << { project_id: project[:id], score: project.score(user), selected: true }
    end

    return recommendations
  end

  def score(user)
    score = 0
    criteria = [:environment, :humanitarian, :social, :research, :preservation, :education]
    criteria.each do |criterium|
      score += 1 if (user[criterium] == 1) && (self[criterium] == 1)
    end
    score += 1 if self[:urgency] == 1
    return score
  end

  def update_completion_rate
    @collected = 0
    self.donations.each do |donation|
      @collected << donation.amount.to_i
    end
    completion_rate = (@collected.fdiv(budget.to_i)*100).floor
  end
end
