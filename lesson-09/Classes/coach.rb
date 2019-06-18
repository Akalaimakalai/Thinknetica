# frozen_string_literal: true

require_relative '../Modules/company'
require_relative '../Modules/validator'

class Coach
  include Company
  include Validator
  attr_reader :number

  TYPE = 'none'.freeze
  FORMAT = /^\d{6}$/.freeze

  def initialize(number, additional = 0)
    @number = number
    @additional = additional
    @engaged = 0
    validate!(@number)
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
