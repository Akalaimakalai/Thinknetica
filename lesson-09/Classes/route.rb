# frozen_string_literal: true

require_relative '../Modules/company'
require_relative '../Modules/instance_counter'
require_relative '../Modules/acсessors'
require_relative '../Modules/validation'
# require_relative '../Modules/validator'

class Route
  include InstanceCounter
  include Acсessors
  include Validation
  # include Validator

  FORMAT = /^( |[а-я]){5,20}$/i.freeze

  attr_reader :first, :last

  def initialize(first, last)
    @first = first
    @last = last
    validate!(@first.name)
    validate!(@last.name)
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
