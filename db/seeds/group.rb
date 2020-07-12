require 'faker'
group = []
5.times do |g|
  g = Faker::Team.name
  group << g
end

group.each do |g|
  Group.create(name:g)
end