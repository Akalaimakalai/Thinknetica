class CargoTrain < Train
  TYPE = "грузовой"
  
  def add_coach(coach)
    begin
      raise if coach.class != CargoCoach
      super
    rescue RuntimeError
      puts "Неправильный тип вагона."
    end
  end
end
