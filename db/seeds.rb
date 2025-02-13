# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
# Clear existing records
Comment.destroy_all
Project.destroy_all
User.destroy_all

# Create Admin
admin = User.create!(name: "Admin User", email: "admin@example.com", password: "password", role: "admin")

# Create Managers
managers = [
  User.create!(name: "Manager 1", email: "manager1@example.com", password: "password", role: "manager"),
  User.create!(name: "Manager 2", email: "manager2@example.com", password: "password", role: "manager")
]

# Create Developers
developers = [
  User.create!(name: "Developer 1", email: "dev1@example.com", password: "password", role: "developer"),
  User.create!(name: "Developer 2", email: "dev2@example.com", password: "password", role: "developer"),
  User.create!(name: "Developer 3", email: "dev3@example.com", password: "password", role: "developer")
]

# Create Projects and Assign Managers & Developers
projects = [
  Project.create!(name: "Project Alpha", status: "Pending", manager: managers[0], developer: developers[0]),
  Project.create!(name: "Project Beta", status: "In Progress", manager: managers[1], developer: developers[1]),
  Project.create!(name: "Project Gamma", status: "Completed", manager: managers[0], developer: developers[2])
]

# Create Comments for Projects
comments = [
  Comment.create!(content: "This project is in the initial phase.", user: managers[0], project: projects[0]),
  Comment.create!(content: "We need to add more features.", user: developers[0], project: projects[0]),
  Comment.create!(content: "Testing phase started!", user: managers[1], project: projects[1]),
  Comment.create!(content: "Bug fixing in progress.", user: developers[1], project: projects[1]),
  Comment.create!(content: "Project completed successfully!", user: developers[2], project: projects[2])
]

puts "✅ Seeded #{User.count} users, #{Project.count} projects, and #{Comment.count} comments successfully!"
