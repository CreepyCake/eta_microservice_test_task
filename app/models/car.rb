class Float
  #degrees to radians
  def to_radians
    self * Math::PI / 180
  end
end

class Car < ActiveRecord::Base
  validates :latitude, :longitude, presence: true

  #calculate haversine distance between all cars and user position
  def self.get_eta(person_position)
    radius = 6371 #earth radius in km
    result = []

    Car.all.each do |car|
      if car.available #close cars might be occupied
        hav1 = Math::sin((car.latitude.to_radians - person_position[:latitude].to_radians) / 2) ** 2
        hav2 = Math::sin((car.longitude.to_radians - person_position[:longitude].to_radians) / 2) ** 2
        result << 2 * radius * Math::asin(Math::sqrt( hav1 +
          + Math::cos(person_position[:latitude].to_radians) * Math::cos(person_position[:longitude].to_radians) * hav2))
      end
    end

    #we want to get top three cars which are closest to user position
    #then we multiply each car position by 1.5 to get ETA
    #and then we calculate average
    result.sort[0..2].map { |r| (r * 1.5).round(3) if r }.inject(0) { |sum, n| sum + n } / 3.0
  end

end