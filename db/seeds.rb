# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

user = User.find_by email: 'bcgoss@gmail.com'
unless user
  user = User.new email: 'bcgoss@gmail.com', password: 'password' 
  if user.save
    puts 'User saved, creating projects'
  else
    puts user.errors.full_messages.join(', ')
  end
else
  puts 'User found'
end

project = user.projects.find_or_create_by(name: 'Project 1', description: 'A project, yo!', link: 'www.example.com/project_1')
if project
  puts 'Project saved!'
else
  puts 'Failed to create Project'
end

post = user.posts.find_or_create_by(title: 'First Post', body: 'This is a post')
if post
  puts 'Post created!'
else
  puts 'Failed to create Post'
end 
