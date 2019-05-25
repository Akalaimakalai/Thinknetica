class CoachC
  attr_reader :number
  
  TYPE = "cargo"

  def initialize(number)
    @number = number
  end
  
  def type
    puts TYPE
  end
end
