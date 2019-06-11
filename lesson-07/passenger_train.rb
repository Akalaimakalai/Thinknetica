class PassengerTrain < Train
  TYPE = "пассажирский"
  
  def add_coach(coach)
    if coach.class == PassengerCoach
      super
    else
      puts "Неправильный тип вагона."
    end
  end
end
