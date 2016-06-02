#create 50 cars with random positions inside square described by max_point and min_point and random availability

max_point = { latitude: 55.911164, longitude: 37.841659 }
min_point = { latitude: 55.571817, longitude: 37.369712 }

50.times do |i|
  r = Random.new
  Car.create!(latitude: r.rand(min_point[:latitude]..max_point[:latitude]).round(6),
              longitude: r.rand(min_point[:longitude]..max_point[:longitude]).round(6),
              available: r.rand(0...10) > 4 ? true : false)
end