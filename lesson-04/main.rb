require_relative 'route'
require_relative 'train'
require_relative 'station'
require_relative 'passenger_coach'
require_relative 'passenger_train'
require_relative 'cargo_train'
require_relative 'cargo_coach'

stations = []
trains = []
coaches = []
routes = []
choice = nil

while choice != 0 do
puts "Чтобы вы хотели сделать?"
puts "-чтобы создать объект наберите 1"
puts "-чтобы управлять объектом наберите 2"
puts "-для выхода наберите 0"

choice = gets.chomp.to_i

case choice
when 1
  choice1 = nil

  while choice1 != 0 do
    puts "Какой объект вы бы хотели создать?"
    puts "-станция, наберите 1"
    puts "-поезд, набериете 2"
    puts "-вагон, наберите 3"
    puts "-маршрутный лист, наберите 4"
    puts "-для возврата в предыдущее меню наберите 0"    

    choice1 = gets.chomp.to_i

    case choice1
    when 1
      puts "Введите название станции:"

      name = gets.chomp.capitalize.to_s
      station = Station.new(name)
      stations << station
      j = ""
      stations.each { |i| puts i.name }

    when 2
      choice12 = nil

      while choice12 != 0 do
        puts "Поезд какого типа выхотите создать?"
        puts "-пассажирский, наберите 1"
        puts "-грузовой, наберите 2"
        puts "-для возврата в предыдущее меню наберите 0"

        choice12 = gets.chomp.to_i

        case choice12
        when 1
          puts "Введите номер поезда"

          number = gets.chomp.to_i
          train = PassengerTrain.new(number)
          trains << train
          trains.each { |i| print "#{i.number}: "; puts i.type }
        when 2
          puts "Введите номер поезда"

          number = gets.chomp.to_i
          train = CargoTrain.new(number)
          trains << train
          trains.each { |i| print "#{i.number}: "; puts i.type }
        end
      end 
    when 3
      choice13 = nil
      while choice13 != 0 do
        puts "Вагон какого типа вы хотите создать?"
        puts "-пассажирский, наберите 1"
        puts "-грузовой, наберите 2"
        puts "-для возврата в предыдущее меню наберите 0"

        choice13 = gets.chomp.to_i

        case choise13
        when 1
          coach = CoachP.new
          coaches << coach
          coaches.each { |i| print "#{i.number}: "; puts i.type }

        when 2
          coach = CoachC.new
          coaches << coach
          coaches.each { |i| print "#{i.number}: "; puts i.type }
        end
      end
    when 4
      puts "Список доступных станций:"
      stations.each { |i| puts i.name }
      puts "Введите название начальной станции:"
      first = gets.chomp.capitalize.to_s
      puts "Введите название конечной станции:"
      last = gets.chomp.capitalize.to_s
      map = []
      stations.each { |i| map << i if i.name == first }
      stations.each { |i| map << i if i.name == last }
      route = Route.new(map[0], map[1])
      puts "Создан маршрут:"
      route.put_list
      routes << route      
    end
  end
when 2
  choice2 = nil

  while choice2 != 0 do
    puts "Каким объектом управлять?"
    puts "-станция, наберите 1"
    puts "-поезд, набериете 2"
    puts "-маршрутный лист, наберите 3"
    puts "-для возврата в предыдущее меню наберите 0"

    choice2 = gets.chomp.to_i

    case choice2
    when 1
      choice21 = nil

      while choice21 != 0 do
        puts "-посмотреть список станций, наберите 1"
        puts "-посмотреть список поездов на станции, наберите 2"
        puts "-принять поезд на станцию, наберите 3"
        puts "-отправить поезд со станции, наберите 4"
        puts "-для возврата в предыдущее меню наберите 0"

        choice21 = gets.chomp.to_i
        
        case choice21
        when 1
          stations.each { |i| puts i.name }
        when 2
          puts "Введите название станции:"
          name = gets.chomp.capitalize.to_s
          station = nil
          stations.each { |i| station = i if i.name == name}

          choice212 = nil

          while choice212 != 0 do
            puts "Какой список будем смотреть?"
            puts "-общий, наберите 1"
            puts "-пассажирские поезда, наберите 2"
            puts "-грузовые поезда, наберите 3"
            puts "-для возврата в предыдущее меню наберите 0"

            choice212 = gets.chomp.to_i
            
            case choice212
            when 1
              station.trains
            when 2
            when 3
            end
          end
        when 3
        when 4
        end
      end
    when 2
    when 3
    when 4
    end
  end
end
end
