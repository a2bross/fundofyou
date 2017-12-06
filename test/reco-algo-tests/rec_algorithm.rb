def recommendation (projects, user, number_of_recommendations)
  recommendations = [
    # {
    # project_id: project.id,
    # score: score
    # },
  ]

  valid_projects = projects.select{ |project| project[:status] == 10 }

  sorted_valid_projects = valid_projects.sort_by{ |project|, [score(project, user), project[:completion_rate]]  }

  sorted_valid_projects.last(number_of_recommendations).each do |project|
    recommendations << { project_id: project[:id], score: score(project, user) }
  end

  return recommendations
end

def score(project, user)
  score = 0
  criteria = [:environment, :humanitarian, :social, :research, :preservation, :education]
  criteria.each do |criterium|
    score += 1 if (user[criterium] == 1) && (project[criterium] == 1)
    score += 1 if project[urgency] == 1
  end
  return score
end
