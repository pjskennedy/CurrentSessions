# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

puts "seeding!"

Admin.create(:name => "Test1", :email => "Test1@test.com", :approved => false, :password => "123456").save
Admin.create(:name => "Test2", :email => "Test2@test.com", :approved => false, :password => "123456").save
Admin.create(:name => "Test3", :email => "Test3@test.com", :approved => false, :password => "123456").save
Admin.create(:name => "Test4", :email => "Test4@test.com", :approved => false, :password => "123456").save
Admin.create(:name => "Test5", :email => "Test5@test.com", :approved => false, :password => "123456").save
Admin.create(:name => "Test6", :email => "Test6@test.com", :approved => false, :password => "123456").save
Admin.create(:name => "Test7", :email => "Test7@test.com", :approved => false, :password => "123456").save