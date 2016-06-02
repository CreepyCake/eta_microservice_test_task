class Float
  def to_radians
    self * Math::PI / 180
  end
end

class Car < ActiveRecord::Base
  validates :latitude, :longitude, presence: true

  def self.get_eta(person_position)
    radius = 6371 #km
    result = []
    Car.all.each do |car|
      hav1 = Math::sin((car.latitude.to_radians - person_position[:latitude].to_radians) / 2) ** 2
      hav2 = Math::sin((car.longitude.to_radians - person_position[:longitude].to_radians) / 2) ** 2
      result << 2 * radius * Math::asin(Math::sqrt( hav1 +
      + Math::cos(person_position[:latitude].to_radians) * Math::cos(person_position[:longitude].to_radians) * hav2))
    end
    result.sort[0..2].map { |r| (r * 1.5).round(3) }.inject(0) { |sum, n| sum + n } / 3.0
  end

end