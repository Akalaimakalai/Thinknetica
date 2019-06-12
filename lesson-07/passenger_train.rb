class PassengerTrain < Train
  TYPE = "пассажирский"
  
  def add_coach(coach)
    begin
      raise if coach.class != PassengerCoach
      super
    rescue RuntimeError
      puts "Неправильный тип вагона."
    end
  end
end
