class SpaceAge
  SECONDS_TO_EARTH_YEAR = 31_557_600.0
  EARTH_TO_PLANET = {
    'mercury' => 0.2408467,
    'venus' => 0.61519726,
    'earth' => 1.0,
    'mars' => 1.8808158,
    'jupiter' => 11.862615,
    'saturn' => 29.447498,
    'uranus' => 84.016846,
    'neptune' => 164.79132
  }

  attr_reader :seconds

  def initialize(input)
    @seconds = input
  end

  def years_on(planet)
    @seconds / SECONDS_TO_EARTH_YEAR / EARTH_TO_PLANET[planet]
  end

  def method_missing(name)
    respond_to_missing?(name) ? years_on(name[3..-1]) : super
  end

  def respond_to_missing?(name)
    name[0..2] == 'on_' && EARTH_TO_PLANET.keys.include?(name[3..-1])
  end
end
