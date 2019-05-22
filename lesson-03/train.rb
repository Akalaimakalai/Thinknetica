class Train
  attr_accessor :speed
  attr_reader :coaches, :type, :number

  def initialize (number, type, coaches)
    @number = number
    @type = type
    @coaches = coaches
    @speed = 0
  end

  def stop
    @speed = 0
  end

  def add_coach
    if @speed != 0
      puts "Слишком опасно прицеплять вагон на ходу"
    else
      @coaches += 1
      puts "Вагонов стало #{@coaches}"
    end
  end

  def remove_coach
    if @speed != 0
      puts "Слишком опасно отцеплять вагон на ходу"
    else
      @coaches -= 1
      puts "Вагонов стало #{@coaches}"
    end
  end

  def add_route(route)
    @route = route.list
    @route[0].take(self)
    current_station
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
    if @current_station == @route[0]
      puts "Конечная."
    else
      previous_station
      current_station.send(self)
      @current_station = previous_station
      current_station.take(self)
    end
  end

  def current_station
    @route.each do|station| 
       if station.train_list.include?(self)
        @current_station = station
       end
      end
      @current_station
  end

  def next_station
    i = @route.index(@current_station)
    @next_station = @route[i + 1]
  end

  def previous_station
    i = @route.index(@current_station)
    @previous_station = @route[i - 1]
  end
end
