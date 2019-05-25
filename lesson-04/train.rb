class Train
  attr_reader :coaches, :number, :speed

  def initialize (number)
    @number = number
    @coaches = []
    @speed = 0
  end

  def speed_up
    @speed += 10
  end

  def speed_down
    @speed -= 10
  end

  def stop
    @speed = 0
  end

  def add_coach(coach)
    if @speed != 0
      puts "Слишком опасно прицеплять вагон на ходу"
    else
      @coaches << coach
      @coaches.each { |coach| puts coach.number }
    end
  end

  def remove_coach(coach)
    if @speed != 0
      puts "Слишком опасно отцеплять вагон на ходу"
    else
      @coaches.delete(coach)
      @coaches.each { |coach| puts coach.number }
    end
  end

  def add_route(route)
    @route = route
    @current_station = @route.list[0]
    @current_station.take(self)
    next_station
  end

  def go
    if next_station
      current_station.send(self)
      @current_station = next_station
      current_station.take(self)    
    else 
      puts "Конечная."
    end    
  end

  def back
    if @current_station == @route.list[0]
      puts "Конечная."
    else
      previous_station
      current_station.send(self)
      @current_station = previous_station
      current_station.take(self)
    end
  end

  def to_s
    if current_station
      puts "Текущая станции: #{current_station.name}"
    else 
      puts "Поезд находится в депо"
    end
  end

  protected 
  #Внутрении методы, необходимые для работы методов go и back
  attr_reader :current_station

  def next_station
    i = @route.list.index(@current_station)
    @route.list[i + 1]
  end

  def previous_station
    i = @route.list.index(@current_station)
    @route.list[i - 1]
  end
end
