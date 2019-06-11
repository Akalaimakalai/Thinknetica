require_relative 'company'
require_relative 'validator'

class Coach
  include Company
  include Validator
  attr_reader :number
  
  TYPE = "none"
  FORMAT = /\d{6}/

  def initialize(number, additional)
    @number = number
    validate!(@number)
  end
  
  def type
    self.class::TYPE
  end
end
