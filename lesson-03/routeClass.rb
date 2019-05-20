class Route

  def initialize(first, last)
    @stops =[]
    @first = first.to_s
    @last = last.to_s
  end

  def add(name)
    @stops << name.to_s
  end

  def remove(name)
    if @stops.include?(name.to_s)
      @stops.delete(name.to_s)
    else
      puts "Такой станции в списке нет."
    end
  end

  def list_maker
    @list = []
    @list << @first
    @stops.each { |i| @list << i}
    @list << @last
  end

  def list
    list_maker
    puts @list
  end
  
end
