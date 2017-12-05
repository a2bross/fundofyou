def recommendation (projects, user, number_of_recommendations)
  recommendations = [
    # {
    # project_id: project.id,
    # score: score
    # },
  ]

  projects.each do |project|
    project_score = score(project, user)
    if recommendation.size < number_of_recommendations
      recommendations << { project_id: project.id, score: project_score }
    elsif project_score > lowest_score(recommendations)
      recommendations = recommendations.sort_by{ |element|, element[:score] }
      recommendations.first = { project_id: project.id, score: project_score }
    end
  end

end

def score(project, user)
  score = 0
  criteria = [:environment, :humanitarian, :social, :research, :preservation, :education]
  criteria.each do |criterium|
    score += 1 if (user[criterium] == 1) && (project[criterium] == 1)
  end
  return score
end
