class CargoCoach < Coach
  TYPE = "грузовой"

  def free
    @engaged ||= 0
    puts "Свободно #{@additional - @engaged} куб.м."
  end

  def engaged
    @engaged ||= 0
    puts "Занято #{@engaged} куб.м."
  end

  def additional
    puts "Объём: #{@additional}куб.м."
  end
end
