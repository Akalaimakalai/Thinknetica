class Route
  attr_reader :list
  
  def initialize(first, last)
    @stations =[]
    @first = first
    @last = last
    list_maker
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

  def list_maker
    @list = [@first, @stations, @last].flatten
  end

  def put_list
    list_maker
    @list.each { |station| puts station.name }
  end
  

  def test 
    puts @stations.to_s
  end
end
