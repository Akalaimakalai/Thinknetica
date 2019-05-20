class Route
  attr_reader :list
  
  def initialize(first, last)
    @stops =[]
    @first = first
    @last = last
    list_maker
  end

  def add(stop)
    @stops << stop
    put_list
  end

  def remove(name)
    if @stops.include?(name)
      @stops.delete(name)
      put_list
    else
      puts "Такой станции в списке нет, либо она одна из конечных."
    end
  end

  def list_maker
    @list = []
    @list << @first
    @stops.each { |i| @list << i}
    @list << @last
  end

  def put_list
    list_maker
    @list.each { |i| puts i.name }
  end
  
end
