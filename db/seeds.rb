# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


User.create(first_name: "Augustin",
  last_name: "de Brosses",
  email: "augustin@fundofyou.fr",
  password: "password",
  )

puts "created user"


Subscription.create(subscription_date: Date.new(2017,12,1),
  user_id: 1,
  amount_cents: 50,
  )

puts "created subscription"


Charity.create(name: "Médecin sans frontière",
  email: "asso@msf.fr",
  description: "MSF is an association that help people",
  )

Charity.create(name: "Croix rouge",
  email: "asso@croix-rouge.fr",
  description: "Red Cross is an association that help people a lot",
  )


puts "created Charities"



Project.create(name: "Help handicaped poeple",
  description: "this is a humanitarian_project",
  contact_name: "Pierre Dupond",
  address: "22 rue du louvre",
  start_date: Date.new(2017,12,6),
  end_date: Date.new(2018,1,6),
  charity_id: 1,
  budget_cents: 300000,
  humanitarian: 1,
  )


Project.create(name: "Help Rohyngas Children",
  description: "this is a educational_project",
  contact_name: "Hubert Laroche",
  address: "23 rue de l'Université",
  start_date: Date.new(2017,12,1),
  end_date: Date.new(2018,12,30),
  charity_id: 2,
  budget_cents: 300000,
  humanitarian: 1,
  )

Project.create(name: "Let's build a school",
  description: "this is another educational_project",
  contact_name: "Hubert Pitanche",
  address: "23 rue de l'Université",
  start_date: Date.new(2017,12,1),
  end_date: Date.new(2018,12,30),
  charity_id: 2,
  budget_cents: 87000,
  education: 1,
  )

Project.create(name: "Let's go to school Again",
  description: "Again this is another educational_project",
  contact_name: "Léon Pistache",
  address: "23 rue de l'Université",
  start_date: Date.new(2017,11,1),
  end_date: Date.new(2017,12,06),
  charity_id: 2,
  budget_cents: 600000,
  education: 1,
  )

Project.create(name:"Help Rohyngas Children",
 description: "this is a educational_project",
 contact_name: "Hubert Laroche",
 address: "23 rue de l'Université",
 start_date: Date.new(2018,01,15),
 end_date: Date.new(2018,02,15),
 charity_id: 2,
 status: 10,
 budget_cents: 300000,
 environment: nil,
 humanitarian: nil,
 social: 1,
 preservation: nil,
 research: nil,
 local: nil,
 abroad: nil,
 urgency: nil,
 education: nil,
 completion_rate: 30,
 photo: nil,
 objectives: nil
 )


puts "created projects"


Item.create(name:
    project_id: 1
    budget_cents: 50
)

puts "created items"

# Donation.create(amount_cents: 12000,
#   execution_date: Date.new(2017,12,30),
#   project_id: 1,
#   subscription_id: 1,
#   user_id: 1,
#   )

# Donation.create(amount_cents: 23000,
#   execution_date: Date.new(2017,11,22),
#   project_id: 2,
#   subscription_id: 1,
#   user_id: 1)

# Donation.create(amount_cents: 23000,
#   execution_date: Date.new(2017,10,22),
#   project_id: 2,
#   subscription_id: 1,
#   user_id: 1)

# Donation.create(amount_cents: 23000,
#   execution_date: Date.new(2017,11,22),
#   project_id: 5,
#   user_id: 1,
#   )


# puts "created donation"

############################################################################

# def generate_project(project_id, array)
#   puts "Creating project..."
#   project = Project.new
#   project.name = "project_#{project_id}"
#   project.budget_cents = (1000..10000).to_a.sample
#   project.start_date = Time.at(rand * Time.now.to_i)
#   project.end_date = project.start_date + (1000..10000).to_a.sample
#   project.charity = Charity.new(name: ["croix rouge", "abbe pierre", "MSF", "Restos du Coeur"].sample)
#   project.status = [1, 10, 20, 30].sample
#   project.environment = array[0]
#   project.humanitarian = array[1]
#   project.social = array[2]
#   project.preservation = array[3]
#   project.research = array[4]
#   project.education = array[5]
#   choice = ["local", "abroad", "both"].sample
#   project.local = ((choice == "local") || (choice == "both")) ? 1 : 0;
#   project.abroad = ((choice == "abroad") || (choice == "both")) ? 1 : 0;
#   project.urgency = [0,1].sample
#   project.completion_rate = (0..150).to_a.sample
#   puts "project_#{project_id} created"
#   project.save!
#   puts "... and saved!"
# end

# def generate_user(user_id, array)
#   puts "Creating user..."
#   user = User.new
#   user.first_name = "user_#{user_id}"
#   user.last_name = ("a".."z").to_a.sample(6).join()
#   user.email = "user#{user_id}@hotmail.com"
#   user.password = "#{user.last_name}"
#   user.address = "fake address"
#   user.environment = array[0]
#   user.humanitarian = array[1]
#   user.social = array[2]
#   user.preservation = array[3]
#   user.research = array[4]
#   user.education = array[5]
#   choice = ["local", "abroad", "both"].sample
#   user.local = ((choice == "local") || (choice == "both")) ? 1 : 0;
#   user.abroad = ((choice == "abroad") || (choice == "both")) ? 1 : 0;
#   puts "user_#{user_id} created"
#   user.save!
#   puts "... and saved!"
# end

# # delete all projects
# puts "Delete all projects"
# Project.delete_all

# #Create new seed projects
# puts "Creating seed projects..."
# puts ""
# project_id = 0
# for i in (0..5) do
#   array = Array.new(6, 0)
#   array[i] = 1
#   if i < 5
#     for j in (i+1..5) do
#       array[j] = 1
#       if j < 5
#         for k in (j+1..5) do
#           array[k] = 1
#           generate_project(project_id, array)
#           project_id += 1
#           array[k] = 0
#         end
#       else
#         generate_project(project_id, array)
#         project_id += 1
#       end
#       array[j] = 0
#     end
#   else
#     generate_project(project_id, array)
#     project_id += 1
#   end
# end


# # delete all users
# puts "Delete all users"
# User.delete_all

# #Create new seed users
# puts "Creating seed users..."
# puts ""
# user_id = 0
# for i in (0..5) do
#   array = Array.new(6, 0)
#   array[i] = 1
#   if i < 5
#     for j in (i+1..5) do
#       array[j] = 1
#       if j < 5
#         for k in (j+1..5) do
#           array[k] = 1
#           generate_user(user_id, array)
#           user_id += 1
#           array[k] = 0
#         end
#       else
#         generate_user(user_id, array)
#         user_id += 1
#       end
#       array[j] = 0
#     end
#   else
#     generate_user(user_id, array)
#     user_id += 1
#   end
# end

# Subscription.create(subscription_date: Date.new(2017,12,1),
#   user_id: 1,
#   amount_cents: 50,
#   )

# puts "created subscription"

# Charity.create(name: "Médecin sans frontière",
#   email: "asso@msf.fr",
#   description: "MSF is an association that help people",
#   )

# puts "created Charity"



# Project.create(name: "Help handicaped poeple",
#   description: "this is a humanitarian_project",
#   contact_name: "Pierre Dupond",
#   address: "22 rue du louvre",
#   start_date: Date.new(2017,12,6),
#   end_date: Date.new(2018,1,6),
#   charity_id: 2,
#   budget_cents: 300000,
#   humanitarian: 1,
#   )

# puts "created project"


# Donation.create(amount_cents: 12000,
#   execution_date: Date.new(2017,12,30),
#   project_id: 2,
#   subscription_id: 1,
#   user_id: 1,
#   )

# puts "created donation"

# def generate_project(project_id, array)
#   puts "Creating project..."
#   project = Project.new
#   project.name = "project_#{project_id}"
#   project.budget_cents = (1000..10000).to_a.sample
#   project.start_date = Time.at(rand * Time.now.to_i)
#   project.end_date = project.start_date + (1000..10000).to_a.sample
#   project.charity = Charity.new(name: ["croix rouge", "abbe pierre", "MSF", "Restos du Coeur"].sample)
#   project.status = [1, 10, 20, 30].sample
#   project.environment = array[0]
#   project.humanitarian = array[1]
#   project.social = array[2]
#   project.preservation = array[3]
#   project.research = array[4]
#   project.education = array[5]
#   choice = ["local", "abroad", "both"].sample
#   project.local = ((choice == "local") || (choice == "both")) ? 1 : 0;
#   project.abroad = ((choice == "abroad") || (choice == "both")) ? 1 : 0;
#   project.urgency = [0,1].sample
#   project.completion_rate = (0..150).to_a.sample
#   puts "project_#{project_id} created"
#   project.save!
#   puts "... and saved!"
# end

# def generate_user(user_id, array)
#   puts "Creating user..."
#   user = User.new
#   user.first_name = "user_#{user_id}"
#   user.last_name = ("a".."z").to_a.sample(6).join()
#   user.email = "user#{user_id}@hotmail.com"
#   user.password = "#{user.last_name}"
#   user.address = "fake address"
#   user.environment = array[0]
#   user.humanitarian = array[1]
#   user.social = array[2]
#   user.preservation = array[3]
#   user.research = array[4]
#   user.education = array[5]
#   choice = ["local", "abroad", "both"].sample
#   user.local = ((choice == "local") || (choice == "both")) ? 1 : 0;
#   user.abroad = ((choice == "abroad") || (choice == "both")) ? 1 : 0;
#   puts "user_#{user_id} created"
#   user.save!
#   puts "... and saved!"
# end

# # delete all projects
# puts "Delete all projects"
# Project.delete_all

# #Create new seed projects
# puts "Creating seed projects..."
# puts ""
# project_id = 0
# for i in (0..5) do
#   array = Array.new(6, 0)
#   array[i] = 1
#   if i < 5
#     for j in (i+1..5) do
#       array[j] = 1
#       if j < 5
#         for k in (j+1..5) do
#           array[k] = 1
#           generate_project(project_id, array)
#           project_id += 1
#           array[k] = 0
#         end
#       else
#         generate_project(project_id, array)
#         project_id += 1
#       end
#       array[j] = 0
#     end
#   else
#     generate_project(project_id, array)
#     project_id += 1
#   end
# end


# # delete all users
# puts "Delete all users"
# User.delete_all

# #Create new seed users
# puts "Creating seed users..."
# puts ""
# user_id = 0
# for i in (0..5) do
#   array = Array.new(6, 0)
#   array[i] = 1
#   if i < 5
#     for j in (i+1..5) do
#       array[j] = 1
#       if j < 5
#         for k in (j+1..5) do
#           array[k] = 1
#           generate_user(user_id, array)
#           user_id += 1
#           array[k] = 0
#         end
#       else
#         generate_user(user_id, array)
#         user_id += 1
#       end
#       array[j] = 0
#     end
#   else
#     generate_user(user_id, array)
#     user_id += 1
#   end
# end
