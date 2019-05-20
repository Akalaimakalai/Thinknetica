class Station
  attr_reader :train_list

  def initialize(name)
    @name = name
    @train_list = []
  end

  def take(train)
    @train_list << train
  end

  def send(train)
    @train_list.delete(train)
  end

  def by_type(type)
    type_list =[]
    @train_list.each do |i|
      if @@type == type
        type_list << i
    end
    type_list
  end
end
