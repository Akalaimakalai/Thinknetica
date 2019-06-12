class PassengerCoach < Coach
  TYPE = "пассажирский"

  def free
    @engaged ||= 0
    puts "Осталось #{@additional - @engaged} свободных мест."
  end

  def engaged
    @engaged ||= 0
    puts "Занято #{@engaged} мест."
  end

  def additional
    puts "Мест: #{@additional}"
  end
end
