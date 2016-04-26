# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
def random_time
  Time.at(rand * Time.now.to_i)
end

tasks = [
  { name: "The First Task", description: "make a list", completed_at: random_time },
  { name: "Go to Brunch", description: "eat french toast with strawberries" },
  { name: "Go to Lunch", description: "eat tacos", completed_at: random_time },
  { name: "Go to Second Lunch", description: "happy hour!" },
  { name: "Play Video Games", description: "quality time with the family", completed_at: random_time },
  { name: "High Five Somebody You Don't Know", description: "that's too hard", completed_at: random_time },
  { name: "Plant Flowers", description: "and make sure to water them too", completed_at: random_time },
  { name: "Call Mom", description: "she is waiting to hear from you" },
  { name: "She worries, you know.", description: "I know" },
  { name: "Nap.", description: "sleepy time!", completed_at: random_time }
]

tasks.each do |task|
  Task.create task
end

Person.create(name: "Suzanne")
Person.create(name: "Sarah")
Person.create(name: "Deirdre")
