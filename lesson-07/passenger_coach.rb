class PassengerCoach < Coach
  TYPE = "пассажирский"

  def initialize(number, seats)
    super
    @seats = seats
    @free_seats = seats
    @engaged_seats = 0
  end

  def new_pass
    if @free_seats > 0
      free_seats -= 1 
      engaged_seats += 1
    end
    free_seats
  end

  def free_seats
      puts "Осталось #{@free_seats} свободных мест."
  end

  def engaged_seats
      puts "Занято #{@engaged_seats} мест."
  end

  def additional
    puts "Мест: #{@seats}"
  end
end
