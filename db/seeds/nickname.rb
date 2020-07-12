require 'faker'

nickname = []

50.times do |n|
  n = Faker::Name.name
  nickname<<n
end

nickname.each_with_index do |n,i|
  i+=1
  Nickname.create(name:n,customer_id:i)
  if i===32
    i=1
  end
end
