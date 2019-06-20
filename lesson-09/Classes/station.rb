# frozen_string_literal: true

require_relative '../Modules/company'
require_relative '../Modules/instance_counter'
require_relative '../Modules/acсessors'
require_relative '../Modules/validation'

class Station
  include InstanceCounter
  include Acсessors
  include Validation

  attr_reader :name, :train_list
  validate :name, :presence
  validate :name, :format, /^( |[а-я]){5,20}$/i
  validate :name, :type, String

  # rubocop:disable Style/ClassVars
  @@all = []
  # rubocop:enable Style/ClassVars
  def initialize(name)
    @name = name
    validate!
    @train_list = []
    @@all << self
    register_instance
  end

  def self.all
    @@all.each { |i| puts i }
  end

  # rubocop:disable Lint/UnusedMethodArgument
  def each_train(&block)
    train_list.each { |train| yield(train) }
  end

  # rubocop:enable Lint/UnusedMethodArgument
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
    each_train do |train|
      print "№#{train.number} "
      print "Тип: #{train.type} "
      puts "Кол-во вагонов:#{train.coaches.length}"
    end
  end
end
