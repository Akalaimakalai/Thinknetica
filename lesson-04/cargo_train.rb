class CargoTrain < Train

  TYPE = "cargo"
  
  def add_coach(coach)
    if coach.type_check == "cargo"
      super
    else
      puts "Неправильный тип вагона."
    end
  end

  def type
    TYPE
  end
end
