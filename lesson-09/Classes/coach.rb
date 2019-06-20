# frozen_string_literal: true

require_relative '../Modules/company'
require_relative '../Modules/acсessors'
require_relative '../Modules/validation'

class Coach
  include Company
  include Acсessors
  include Validation

  attr_reader :number
  validate :number, :presence
  validate :number, :format, /^\d{6}$/
  validate :number, :type, Integer

  TYPE = 'none'.freeze

  def initialize(number, additional = 0)
    @number = number
    @additional = additional
    @engaged = 0
    validate!
  end

  def fill(value = 1)
    @engaged ||= 0
    if (@engaged + value) <= @additional
      @engaged += value
    else
      puts 'Мало места'
    end
    free
  end

  def type
    self.class::TYPE
  end
end
