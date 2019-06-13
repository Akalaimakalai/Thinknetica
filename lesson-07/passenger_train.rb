class PassengerTrain < Train
  TYPE = "пассажирский"
  
  def add_coach(coach)
    raise if coach.class != PassengerCoach
    super
  end
end
