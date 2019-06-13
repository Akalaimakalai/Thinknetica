class CargoTrain < Train
  TYPE = "грузовой"
  
  def add_coach(coach)
    raise if coach.class != CargoCoach
    super
  end
end
