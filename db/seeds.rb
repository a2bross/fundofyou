# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

  # project1 = Project.create([{ name:'Jo le taxi animalier' },
  # { description:  'Le métier de Taxi Animalier est un métier trés peu connu de nos jours mais il est en pleine expansion. Tout le monde ne peut pas
  #   l exercer car il est très réglementé. En effet, il faut suivre une formation TAV (Transport d’Animaux Vivants) et obtenir l’agrément correspondant. Ensuite, il faut avoir un véhicule équipé en respectant les normes d’hygiène et de sécurité. Monter un dossier de demande d’agrément à transmettre à la Direction Départementale des Services Vétérinaires. Cet agrément est donné pour le véhicule ET pour le chauffeur.'},
  #   { contact_name: 'Jo' },
  #   { address: '44 rue amelot, 75011 Paris' },
  #   { start_date: Date.today },
  #   { end_date: Date.today },
  #   {charity_id: '' },
  #   {status: 'En cours' },
  #  ])

def generate_project(project_id, array)
  puts "Creating project..."
  project = Project.new
  project.name = "project_#{project_id}"
  project.budget_cents = (1000..10000).to_a.sample
  project.start_date = Time.at(rand * Time.now.to_i)
  project.end_date = project.start_date + (1000..10000).to_a.sample
  project.charity = Charity.new(name: ["croix rouge", "abbe pierre", "MSF", "Restos du Coeur"].sample)
  project.status = [1, 10, 20, 30].sample
  project.environment = array[0]
  project.humanitarian = array[1]
  project.social = array[2]
  project.preservation = array[3]
  project.research = array[4]
  project.education = array[5]
  choice = ["local", "abroad", "both"].sample
  project.local = ((choice == "local") || (choice == "both")) ? 1 : 0;
  project.abroad = ((choice == "abroad") || (choice == "both")) ? 1 : 0;
  project.urgency = [0,1].sample
  puts "project_#{project_id} created"
  project.save!
  puts "... and saved!"
end

def generate_user(user_id, array)
  puts "Creating user..."
  user = User.new
  user.first_name = "user_#{user_id}"
  user.last_name = ("a".."z").to_a.sample(5)
  user.email = "user#{user_id}@hotmail.com"
  user.password = "#{user.last_name}"
  user.address = "fake address"
  user.environment = array[0]
  user.humanitarian = array[1]
  user.social = array[2]
  user.preservation = array[3]
  user.research = array[4]
  user.education = array[5]
  choice = ["local", "abroad", "both"].sample
  user.local = ((choice == "local") || (choice == "both")) ? 1 : 0;
  user.abroad = ((choice == "abroad") || (choice == "both")) ? 1 : 0;
  puts "user_#{user_id} created"
  user.save!
  puts "... and saved!"
end

# delete all projects
puts "Delete all projects"
Project.delete_all

#Create new seed projects
puts "Creating seed projects..."
puts ""
project_id = 0
for i in (0..5) do
  array = Array.new(6, 0)
  array[i] = 1
  if i < 5
    for j in (i+1..5) do
      array[j] = 1
      if j < 5
        for k in (j+1..5) do
          array[k] = 1
          generate_project(project_id, array)
          project_id += 1
          array[k] = 0
        end
      else
        generate_project(project_id, array)
        project_id += 1
      end
      array[j] = 0
    end
  else
    generate_project(project_id, array)
    project_id += 1
  end
end


# delete all users
puts "Delete all users"
User.delete_all

#Create new seed users
puts "Creating seed users..."
puts ""
user_id = 0
for i in (0..5) do
  array = Array.new(6, 0)
  array[i] = 1
  if i < 5
    for j in (i+1..5) do
      array[j] = 1
      if j < 5
        for k in (j+1..5) do
          array[k] = 1
          generate_user(user_id, array)
          user_id += 1
          array[k] = 0
        end
      else
        generate_user(user_id, array)
        user_id += 1
      end
      array[j] = 0
    end
  else
    generate_user(user_id, array)
    user_id += 1
  end
end
