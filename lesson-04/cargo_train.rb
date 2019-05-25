class CargoTrain < Train
  def add_coach(coach)
    if coach.type == "cargo"
      super
    else
      puts "Неправильный тип вагона."
    end
  end

  def remove_coach(coach)
    if coach.type == "cargo"
      super
    else
      puts "Неправильный тип вагона."
    end
  end
end
