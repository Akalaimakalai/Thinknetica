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
    @way = 1
    current_station
    next_station
  end

  def go
    if @current_station == @route.last
      @next_station = nil
      puts "Конечная."
    else
      @way = 1
      current_station
      next_station
      @current_station.send(self)
      @next_station.take(self)
      current_station
      next_station
      previous_station
    end
  end

  def back
    if @current_station == @route.first
      @next_station = nil
      puts "Конечная."
    else    
      @way = 2
      current_station
      next_station
      @current_station.send(self)
      @next_station.take(self)
      current_station
      next_station
      previous_station
    end
  end

  def current_station
    @route.each do|station| 
       if station.train_list.include?(self)
        @current_station = station
       end
      end
    puts "Станция #{@current_station.name}"
  end

  def next_station
    i = @route.index(@current_station)
    if @way == 1 && @current_station == @route.last
      @next_station = nil
    elsif  @way == 2 && @current_station == @route.first
      @next_station = nil
    elsif @way == 1
      @next_station = @route[i + 1]
      puts "Следующая станция #{@next_station.name}"
    elsif @way == 2
      @next_station = @route[i - 1]
      puts "Следующая станция #{@next_station.name}"
    end      
  end

  def previous_station
    i = @route.index(@current_station)
    if @way == 1
      @previous_station = @route[i - 1]
      puts "Предыдущая станция #{@previous_station.name}"
    elsif @way == 2
      @previous_station = @route[i + 1]
      puts "Предыдущая станция #{@previous_station.name}"
    end    
  end

end
