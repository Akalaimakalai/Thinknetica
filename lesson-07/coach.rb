require_relative 'company'
require_relative 'validator'

class Coach
  include Company
  include Validator
  attr_reader :number
  
  TYPE = "none"
  FORMAT = /^\d{6}$/

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
      puts "Мало места"
    end
    free
  end
  
  def type
    self.class::TYPE
  end
end
