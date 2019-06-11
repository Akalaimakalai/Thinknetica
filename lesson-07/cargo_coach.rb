class CargoCoach < Coach
  TYPE = "грузовой"

  def initialize(number, size)
    super
    @size = size
    @free_size = size
    @engaged_size = 0
  end

  def load(value)
    if (@engaged_size + value) <= @size
      @free_size -= value
      @engaged_size += value
      free_size
    else
      puts "Мало места"
      free_size
    end
  end

  def free_size
    puts "Свободно #{@free_size} куб.м."
  end

  def engaged_size
    puts "Занято #{@engaged_size} куб.м."
  end

  def additional
    puts "Объём: #{@size}куб.м."
  end
end
