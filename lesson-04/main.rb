require_relative 'route'
require_relative 'train'
require_relative 'station'
require_relative 'passenger_coach'
require_relative 'passenger_train'
require_relative 'cargo_train'
require_relative 'cargo_coach'

@stations = []
@trains = []
@coaches = []
@routes = []

def find_station
  station = nil
  while station == nil do
    puts "Выберите станцию."
    name = gets.chomp.capitalize.to_s
    break if name == "0"
    @stations.each { |i| station = i if i.name == name}
    puts "Такой станции нет в списке."if station == nil
  end
  station
end

def find_train
  train = nil
  while train == nil do
    puts "Введите номер поезда."
    number = gets.chomp.to_i
    break if number == 0
    @trains.each { |i| train = i if i.number == number}
    puts "Нет такого поезда." if train == nil
  end
  train
end

def find_coach
  coach = nil
  while coach == nil do
    puts "Введите номер вагона."
    number = gets.chomp.to_i
    break if number == 0
    @coaches.each { |i| coach = i if i.number == number }
    puts "Нет такого вагона." if coach == nil
  end
  coach         
end

def find_route
  route = nil
  while route == nil do
    puts "С каким № маршрутного листа работаем?"
    number = gets.chomp.to_i
    break if number <= 0
    route = @routes[number - 1]
    puts "Нет такого маршрутного листа." if route == nil
  end
  route
end

def make_coach(type)
  puts "Введите номер вагона."
  number = gets.chomp.to_i
  coach = type.new(number)
  @coaches << coach
end

def make_train(type)
  puts "Введите номер поезда"
  number = gets.chomp.to_i
  train = type.new(number)
  @trains << train
end

def stations_list
  puts "Список доступных станций:"
  @stations.each { |i| puts i.name }
end

def trains_list
  puts "Список доступных поездов:"
  @trains.each { |i| puts i.number }
end

def coaches_list
  puts "Список доступных вагонов:"
  @coaches.each { |i| print "#{i.number}: "; puts i.type_check }
end

def coaches_in_train(train)
  puts "Список вагонов в составе:"
  train.coaches.each { |i| puts i.number }
end

def routes_list
  puts "Список маршрутных листов:"
  @routes.each { |i| print "№#{@routes.index(i) + 1}:"; i.put_list }
end


choice = nil

while choice != 0 do
puts "Чтобы вы хотели сделать?"
puts "-чтобы создать объект, наберите 1"
puts "-чтобы управлять объектом, наберите 2"
puts "-посмотреть списки созданых объектов, наберите 3"
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
      @stations << station
      stations_list
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
          make_train(PassengerTrain)
          trains_list
        when 2
          make_train(CargoTrain)
          trains_list
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

        case choice13
        when 1
          make_coach(CoachP)
          coaches_list
        when 2
          make_coach(CoachC)
          coaches_list
        end
      end
    when 4
      stations_list
      puts "Укажите начало маршрута."
      first = find_station
      puts "Укажите конец маршрута."
      last = find_station
      route = Route.new(first, last)
      route.put_list
      @routes << route      
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
      stations_list
      stop = find_station
      choice21 = 0 if stop == nil

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
          trains_list
          express = find_train
          stop.take(express) if express
        when 3
          stop.trains
          express = find_train
          stop.send(express) if express
        end
      end  
    when 2
      choice22 = nil
      trains_list
      train = find_train
      choice22 = 0 if train == nil

      while choice22 != 0 do
        puts "Что будем делать?"
        puts "-добавить вагон в состав, наберите 1"
        puts "-удалить вагон из состава, наберите 2"
        puts "-получить маршрутный лист, наберите 3"
        puts "-очистить маршрутный лист, наберите 4"
        puts "-отправитьс на следующую станцию, наберите 5"
        puts "-вернуться на предыдущую станцию, наберите 6"
        puts "-для возврата в предыдущее меню наберите 0"
        choice22 = gets.chomp.to_i

        case choice22
        when 1
          coaches_list
          carriage = find_coach
          train.add_coach(carriage) if carriage
          coaches_in_train(train)
        when 2
          coaches_in_train(train)
          carriage = find_coach
          train.remove_coach(carriage) if carriage
        when 3
          routes_list
          way = find_route
          train.add_route(way) if way
        when 4
          train.remove_route
        when 5
          train.go
        when 6
          train.back
        end
      end
    when 3
      choice23 = nil
      route = find_route

      while choice23 != 0 do
      puts "Что делаем?"
      puts "-добавить станцию, наберите 1"
      puts "-удалить станцию, наберите 2"
      puts "-для возврата в предыдущее меню наберите 0"

      choice23 = gets.chomp.to_i
      
      case choice23
      when 1
        stop = find_station
        route.add(stop)
        route.put_list
      when 2
        route.put_list
        stop = find_station
        route.remove(stop)
      end
      end
    end
  end
when 3
  choice 3 = nil

  while choice3 != 0 do
    puts "-посмотреть список станций, наберите 1"
    puts "-посмотреть список поездов, наберите 2"
    puts "-посмотреть список вагонов, наберите 3"
    puts "-посмотреть список маршрутов, наберите 4"
    puts "-для возврата в предыдущее меню наберите 0"
    choice3 = gets.chomp.to_i

    case choice1
    when 1
      stations_list
    when 2
      trains_list
    when 3
      coaches_list
    when 4
      routes_list
    end
  end
end
end

