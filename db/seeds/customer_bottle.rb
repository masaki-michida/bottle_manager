c=0
i=0

32.times do 
  c+=1
  i+=1

  if c > 10
    c=0
  end

  CustomerBottle.create(customer_id: i,bottle_id:c)

end