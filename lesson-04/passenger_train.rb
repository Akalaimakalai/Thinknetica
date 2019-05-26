class PassengerTrain < Train

  TYPE = "passenger"

  def add_coach(coach)
    if coach.type_check == "passenger"
      super
    else
      puts "Неправильный тип вагона."
    end
  end
  
  def type
    TYPE
  end
end
