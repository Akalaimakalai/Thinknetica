require_relative 'instance_counter'
require_relative 'validator'

class Route
  include InstanceCounter
  include Validator
  attr_reader :first, :last
  FORMAT = /^( |[а-я]){5,20}$/i

  def initialize(first, last)
    @first = first
    @last = last
    validate!(@first.name)
    validate!(@last.name)
    @map =[]
    register_instance
  end

  def add(station)
    @map << station unless self.list.include?(station) 
  end

  def remove(station)
    @map.delete(station) if @map.include?(station)
  end

  def put_list
    puts "Список станций в маршрутном листе:"
    list.each { |i| puts i.name }
  end

  def list
    [@first, @map, @last].flatten
  end
end
