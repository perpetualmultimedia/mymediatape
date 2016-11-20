# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require 'csv'


puts "Importing states..."
CSV.foreach(Rails.root.join("states.csv"), headers: true) do |row|
  State.create! do |state|
    state.name = row[0]
  end
end