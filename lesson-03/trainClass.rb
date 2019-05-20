class Train
  attr_accessor :speed
  attr_reader :coaches, :current_station, :next_station, :previous_station, :type

  def initialize (number, type, coaches)
    @number = number
    @type = type
    @coaches = coaches
    @speed = 0
  end

  def stop
    @speed = 0
  end

  def add_coach?(add)
    if @speed != 0
      puts "Слишком опасно прицеплять/oтцеплять вагоны на ходу"
    elsif add
      @coaches += 1
    else
      @coaches -= 1
    end
  end

  def add_route(route)
    @route = route.list
    @route[0].take(self)
    @current_station = @route[0]
    @next_station = @route[1]
  end

  def go
    i = @route.index(@current_station)
    @route[i].send(self)
    @current_station = @route[i + 1]
    @route[i + 1].take(self)
    @next_station = @route[i + 2]
    @previous_station = @route[i]
  end

  def back
    i = @route.index(@current_station)
    @route[i].send(self)
    @current_station = @route[i - 1]
    @route[i - 1].take(self)
    @previous_station= @route[i]
    if (i - 2) < 0
      @next_station  = @route[i - 2]
    end
  end

end
