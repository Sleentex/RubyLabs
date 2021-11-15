require 'json'

class Car
  attr_accessor :id, :name, :year, :price, :distance, :fuel, :volume, :gearbox, :img_url
  def initialize(id, name, year, price, distance, fuel, volume, gearbox, img_url)
    @id              = id
    @name            = name
    @year            = year
    @price           = price
    @distance        = distance
    @fuel            = fuel
    @volume          = volume
    @gearbox         = gearbox
    @img_url         = img_url
  end

  def values
      [@id, @name, @year, @price, @distance, @fuel, @volume, @gearbox, @img_url]
  end
end