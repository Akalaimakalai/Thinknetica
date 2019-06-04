class PassengerTrain < Train
  @instances = 0
  
  def add_coach(coach)
    if coach.class == PassangerCoach
      super
    else
      puts "Неправильный тип вагона."
    end
  end
 end
