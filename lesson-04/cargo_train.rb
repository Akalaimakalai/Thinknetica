class CargoTrain < Train
  def add_coach(coach)
    if coach.class == CargoCoach
      super
    else
      puts "Неправильный тип вагона."
    end
  end
end
