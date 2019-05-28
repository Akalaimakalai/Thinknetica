class Route
   
  def initialize(first, last)
    @map =[]
    @first = first
    @last = last
  end

  def add(station)
    if @map.include?(station)
      puts "Такая станция уже есть." 
    else
      @map << station
    end
  end

  def remove(station)
    if @map.include?(station)
      @map.delete(station)
      put_list
    else
      puts "Такой станции в списке нет, либо она одна из конечных."
    end
  end

  def put_list
    puts "Список станций в маршрутном листе:"
    list.each { |i| puts i.name }
  end

  def list
    [@first, @map, @last].flatten
  end
end
