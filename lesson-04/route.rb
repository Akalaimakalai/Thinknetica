class Route
   
  def initialize(first, last)
    @stations =[]
    @first = first
    @last = last
  end

  def add(station)
    @stations << station
    put_list
  end

  def remove(station)
    if @stations.include?(station)
      @stations.delete(station)
      put_list
    else
      puts "Такой станции в списке нет, либо она одна из конечных."
    end
  end

  def put_list
    list.each { |station| puts station.name }
  end

  def list
    [@first, @stations, @last].flatten
  end
end
