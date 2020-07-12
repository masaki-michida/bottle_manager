

10.times do |i|
  i+=1
  a = Random.rand(1..4)
  b = Random.rand(1..100)
  c = Random.rand(200..1000)
  d = Random.rand(500..5000)
  Bottle.create(local_number:i,kind_of_alchol_id:a,liquid_level:c,karaoke:d,status:b)
end