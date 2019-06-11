require_relative 'instance_counter'
require_relative 'validator'

class Station
  include InstanceCounter
  include Validator
  attr_reader :name, :train_list
  FORMAT = /^( |[а-я]){5,20}$/i
  @@all = []


  def initialize(name)
    @name = name
    validate!(@name)
    @train_list = []
    @@all << self
    register_instance
  end

  def self.all
    @@all.each { |i| puts i }
  end

  def train_is_here?(train)
    if train_list.include?(train)
      puts "Поезд №#{train.number} находится станции #{@name}."
      true
    else      
      puts "На станции #{@name} поезд №#{train.number} не найден."
      false
    end
  end

  def take(train)
    @train_list << train unless train_is_here?(train)
    train_is_here?(train)
  end

  def free(train)
    @train_list.delete(train) if train_is_here?(train)
    train_is_here?(train)
  end

  def by_type(type)
    @type_list = @train_list.select { |i| i.class == type }
    puts "Список поездов типа: '#{type}' на станции #{@name}:"
    @type_list.each { |train| puts train.number }
  end
  
  def trains
    puts "Список поездов на станции #{@name}:"
    @train_list.each { |train| puts train.number }
  end
end
