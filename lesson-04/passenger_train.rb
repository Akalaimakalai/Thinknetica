class PassengerTrain < Train
  def add_coach(coach)
    if coach.type == "passenger"
      super
    else
      puts "Неправильный тип вагона."
    end
  end

  def remove_coach(coach)
    if coach.type == "passenger"
      super
    else
      puts "Неправильный тип вагона."
    end
  end
end
