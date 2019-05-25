class CoachP
  attr_reader :number

  TYPE = "passenger"

  def initialize(number)
    @number = number
  end 

  def type
    puts TYPE
  end
end
