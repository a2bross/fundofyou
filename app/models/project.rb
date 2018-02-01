class Project < ApplicationRecord
  belongs_to :charity
  has_many :rewards, dependent: :destroy
  has_many :items, dependent: :destroy
  has_many :donations, dependent: :destroy
  has_many :users, through: :donations
  monetize :budget_cents
  validates :name, :budget, :description, :start_date, :end_date, :charity, presence: true
  validates :budget, numericality: { greater_than: 0 }
  validates :objectives, length: { maximum: 200 }
  mount_uploader :photo, ProjectUploader
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
  after_save :check_if_started, :check_if_ended
  accepts_nested_attributes_for :items


  def self.recommendation (user, number_of_recommendations)
    recommendations = [
      # {
      # project_id: project.id,
      # score: score
      # },
    ]

    valid_projects = Project.all.select{ |project| ((project[:status] == 10) && (project[:completion_rate] < 100)) }

    sorted_valid_projects = valid_projects.sort_by{ |project| [project.score(user), project[:completion_rate]] }

    sorted_valid_projects.last(number_of_recommendations).reverse.each do |project|
      recommendations << { project_id: project[:id], score: project.score(user), selected: true }
    end
    return recommendations
  end

  def score(user)
    score = 0
    criteria = [:environment, :humanitarian, :social, :research, :preservation, :education, :local, :abroad]
    criteria.each do |criterium|
      score += 1 if (user[criterium] == 1) && (self[criterium] == 1)
    end
    score += 1 if self[:urgency] == 1
    return score
  end

  def update_completion_rate
    collected = 0
    self.donations.where(status: 20).each do |donation|
      collected += donation.amount_cents
    end
    rate = (collected.fdiv(budget_cents)*100).to_i unless budget_cents == 0
    update(completion_rate: rate)
  end

  def check_if_started
    if self.status == 0 && self.start_date <= Date.today && self.start_date <= self.end_date
      self.update(status:  10)
    end
  end

  def check_if_ended
    if (self.status == 0 || self.status == 10) && self.end_date < Date.today
      self.update(status: 20)
    end
  end

  def self.update_status
    Project.all.each do |projet|
      projet.check_if_started
      projet.check_if_started
      projet.update_completion_rate
    end
  end
end
