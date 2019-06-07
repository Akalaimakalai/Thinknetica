require_relative 'instance_counter'

class Route
  include InstanceCounter
  attr_reader :first, :last
  NAME_FORMAT = /^( |[а-я]){5,20}$/i

  def initialize(first, last)
    @first = first
    @last = last
    validate!
    @map =[]
    register_instance
  end

  def add(station)
    if self.list.include?(station)
      puts "Такая станция уже есть." 
    else
      @map << station
    end
  end

  def remove(station)
    if @map.include?(station)
      @map.delete(station)
      put_list
    else
      puts "Такой станции в списке нет, либо она одна из конечных."
    end
  end

  def put_list
    puts "Список станций в маршрутном листе:"
    list.each { |i| puts i.name }
  end

  def list
    [@first, @map, @last].flatten
  end

  def valid?
    validate!
    true
  rescue
    false
  end

  protected
  def validate!
    raise "Wrong station's name format!!!" if (first !~ NAME_FORMAT) || (last !~ NAME_FORMAT)
  end
end
