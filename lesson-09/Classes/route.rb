# frozen_string_literal: true

require_relative '../Modules/company'
require_relative '../Modules/instance_counter'
require_relative '../Modules/acсessors'
require_relative '../Modules/validation'

class Route
  include InstanceCounter
  include Acсessors
  include Validation

  attr_reader :first, :last
  validate :first_name, :presence
  validate :first_name, :format, /^( |[а-я]){5,20}$/i
  validate :first_name, :type, String
  validate :last_name, :presence
  validate :last_name, :format, /^( |[а-я]){5,20}$/i
  validate :last_name, :type, String

  def initialize(first, last)
    @first = first
    @last = last
    @first_name = @first.name
    @last_name = @last.name
    validate!
    @map = []
    register_instance
  end

  def add(station)
    @map << station unless list.include?(station)
  end

  def remove(station)
    @map.delete(station) if @map.include?(station)
  end

  def put_list
    puts 'Список станций в маршрутном листе:'
    list.each { |i| puts i.name }
  end

  def list
    [@first, @map, @last].flatten
  end
end
