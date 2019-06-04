class Station
  include InstanceCounter
  attr_reader :name, :train_list
  @@all = []

  def initialize(name)
    @name = name
    @train_list = []
    @@all << self
    register_instance
  end

  def self.all
    @@all.each { |i| puts i }
  end

  def take(train)
    if @train_list.include?(train)
      puts "Поезд №#{train.number} уже на станции."
    else
      @train_list << train
      puts "Поезд №#{train.number} принят на станцию #{@name}"
    end
  end

  def free(train)
    if @train_list.include?(train)
      puts "Поезд №#{train.number} отправлен со станции #{@name}"
      @train_list.delete(train)
    else
      puts "Такого поезда на станции #{@name} нет."
    end
  end

  def by_type(type)
    @type_list = @train_list.select { |i| i.class == type }
    puts "Список поездов типа: '#{type}' на станции #{@name}:"
    @type_list.each { |train| puts train.number }
  end
  
  def trains
    puts "Список поездов на станции #{@name}:"
    @train_list.each { |train| puts train.number }
    end
end
