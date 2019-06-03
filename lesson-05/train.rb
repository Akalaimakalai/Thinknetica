class Train
  include Company
  include InstanceCounter
  attr_reader :coaches, :number, :speed, :current_station
  @@all = []

  def initialize (number)
    @number = number
    @coaches = []
    @speed = 0
    @@all << self
  end

  def self.find(number)
    @@all.find { |i| i.number == number }
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
    elsif @coaches.include?(coach)
      @coaches.delete(coach)
      @coaches.each { |coach| puts coach.number }
    else
      puts "В составе нет такого вагона."
    end
  end

  def add_route(route)
    @route = route
    @current_station = @route.list[0]
    @current_station.take(self)
    next_station
  end

  def remove_route
    if @route
      @route = []
      puts "Маршрутный лист очищен."
    else
      puts "Маршрутный лист не задан."
    end
  end

  def go
    if next_station
      current_station.free(self)
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
      current_station.free(self)
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

  def next_station
    i = @route.list.index(@current_station)
    @route.list[i + 1]
  end

  def previous_station
    i = @route.list.index(@current_station)
    @route.list[i - 1]
  end
end
