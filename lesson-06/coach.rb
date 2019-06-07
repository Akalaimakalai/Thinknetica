require_relative 'company'

class Coach
  include Company
  attr_reader :number, :type
  
  
  NUMBER_FORMAT = /^\d{6}$/i

  def initialize(number)
    @number = number
    validate!
    @type = self.class
  end
  
  def valid?
    validate!
    true
  rescue
    false
  end

  protected
  def validate!
    raise "Wrong number format!!!" if number !~ NUMBER_FORMAT
  end
end
