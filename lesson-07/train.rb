require_relative 'company'
require_relative 'instance_counter'
require_relative 'validator'

class Train
  include Company
  include InstanceCounter
  include Validator
  attr_reader :coaches, :number, :speed, :current_station, :route
  @@all = {}
  TYPE = "none"
  FORMAT = /^(\d|[а-я]){3}(-)?(\d|[а-я]){2}$/i
  
  def initialize(number)
    @number = number
    validate!(@number)
    @coaches = []
    @route = []
    @speed = 0
    @@all[number.to_s.to_sym] = self
    register_instance
  end

  def self.find(number)
    @@all[number.to_s.to_sym]
  end

  def speed_up
    @speed += 10
  end

  def speed_down
    @speed -= 10
  end

  def stop
    @speed = 0
  end

  def speed?
    if speed == 0
      puts "Поезд стоит"
      true
    else
      puts "Поезд движется"
      false
    end
  end

  def add_coach(coach)
    @coaches << coach if speed?
  end

  def remove_coach(coach)
    @coaches.delete(coach) if speed?
  end

  def block(&block)
    @coaches.each { |coach| block.call(coach) }
  end

  def add_route(route)
    @route = route
    @current_station = @route.list[0]
    @current_station.take(self)
    next_station
  end

  def remove_route
    @route = []
  end

  def go
    current_station.free(self)
    @current_station = next_station
    current_station.take(self) 
  end

  def back
    previous_station
    current_station.free(self)
    @current_station = previous_station
    current_station.take(self)
  end

  def next_station
    i = @route.list.index(@current_station)
    @route.list[i + 1]
  end

  def previous_station
    i = @route.list.index(@current_station)
    @route.list[i - 1]
  end

  def type
    self.class::TYPE
  end
end
