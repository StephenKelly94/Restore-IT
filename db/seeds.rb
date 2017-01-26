# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'ffaker'

def create_service (user, service)
  user_service = user.services.create(name: service)
  create_folders(user_service)
end

def create_folders (service)
  root = service.folders.create(name: "root")
  create_files(root)
  level_a = root.children.create([{name: "level_a1"}, {name: "level_a2"}])
  level_a.each do |folder, index|
    folder.children.create([{name: "level_b#{index}"}, {name: "level_b#{index}"}])
  end
end

def create_files (root)
  3.times do |i|
    root.user_files.create(name: "file_#{i}")
  end
end

# Users
3.times do
  password = FFaker::Internet.password
  user = User.create(email: FFaker::Internet.email, password: password, password_confirmation: password)
  ["Dropbox", "Onedrive", "Googledrive"].each do |service|
    create_service(user, service)
  end
end
