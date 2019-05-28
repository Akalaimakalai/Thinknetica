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
      station = nil

      stations.each { |i| puts i.name }

      while station == nil do
      puts "С какой станцией будем работать?"
      name = gets.chomp.capitalize.to_s
      if name == "0"
        choice21 = 0
        break
      end   
      stations.each { |i| station = i if i.name == name}
      puts "Такой станции нет в списке."if station == nil
      end

      while choice21 != 0 do
        puts "Что будем делать?"
        puts "-посмотреть список поездов на станции, наберите 1"
        puts "-принять поезд на станцию, наберите 2"
        puts "-отправить поезд со станции, наберите 3"
        puts "-для возврата в предыдущее меню наберите 0"

        choice21 = gets.chomp.to_i
        
        case choice21
        when 1
          choice211 = nil

          while choice211 != 0 do
            puts "Какой список будем смотреть?"
            puts "-общий, наберите 1"
            puts "-пассажирские поезда, наберите 2"
            puts "-грузовые поезда, наберите 3"
            puts "-для возврата в предыдущее меню наберите 0"

            choice211 = gets.chomp.to_i
            
            case choice211
            when 1
              station.trains
            when 2
              station.by_type("passenger")
            when 3
              station.by_type("cargo")
            end
          end
        when 2
          train = nil

          while train == nil do
          puts "Введите номер поезда."
          number = gets.chomp.to_i
          trains.each { |i| train = i if i.number == number}
          puts "Нет такого поезда." if train == nil
          end

          station.take(train)
        when 3
          train = nil

          while train == nil do
          puts "Введите номер поезда."
          number = gets.chomp.to_i
          station.train_list.each { |i| train = i if i.number == number}
          puts "Такого поезда нет на станции." if train == nil
          end

          station.send(train)
        end
      end  
    when 2
      choice22 = nil
      train = nil
      trains.each { |i| puts i.number }

      while train == nil do
        puts "С каким поездом будем работать?"
        number = gets.chomp.to_i
        if number == 0 
          choice22 = 0
          break
        end    
        trains.each { |i| train = i if i.number == number}
        puts "Такого поезда нет в списке."if train == nil
      end

      while choice22 != 0 do
        puts "Что будем делать?"
        puts "-добавить вагон в состав, наберите 1"
        puts "-удалить вагон из состава, наберите 2"
        puts "-получить маршрутный лист, наберите 3"
        puts "-очистить маршрутный лист, наберите 4"
        puts "-отправитьс на следующую станцию, наберите 5"
        puts "-вернуться на предыдущую станцию, наберите 6"
        puts "-для возврата в предыдущее меню наберите 0"

        case choise22
        when 1
          coach = nil

          while coach == nil do
          puts "Введите номер вагона."
          number = gets.chomp.to_i
          break if number == 0
          coaches.each { |i| coach = i if i.number == number }
          puts "Нет такого вагона." if coach == nil
          end          
          train.add_coach(coach) if coach
        when 2
          puts "Список вагонов в составе:"
          train.coaches.each { |i| puts i.number }
          puts "Какой удалить?"
          number = gets.chomp.to_i
          train.remove_coach(number)
        when 3
          route = nil
          routes.each { |i| print "№#{routes.index(i) + 1}:"; i.put_list }

          while route == nil do
            puts "Какой № маршрутного листа ему задать?"
            route = gets.chomp.to_i
            break if route == 0
            train.add_route(routes[route - 1])
          end
        when 4
          train.remove_route
        when 5
          train.go
        when 6
          train.back
        end
      end
    when 3
    when 4
    end
  end
end
end

