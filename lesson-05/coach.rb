class Coach
  include Company
  
  attr_reader :number
  
  TYPE = "none"

  def initialize(number)
    @number = number
  end
  
  def type
    puts TYPE
  end

  def type_check
    TYPE
  end
end
