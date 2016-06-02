max_point = { latitude: 55.911164, longitude: 37.841659 }
min_point = { latitude: 55.571817, longitude: 37.369712 }

50.times do |i|
  r = Random.new
  Car.create!(latitude: r.rand(min_point[:latitude]..max_point[:latitude]),
              longitude: r.rand(min_point[:longitude]..max_point[:longitude]))
end