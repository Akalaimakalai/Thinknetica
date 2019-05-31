class Menu
  require_relative 'route'
  require_relative 'train'
  require_relative 'coach'
  require_relative 'station'
  require_relative 'passenger_coach'
  require_relative 'passenger_train'
  require_relative 'cargo_train'
  require_relative 'cargo_coach'

  def start
    @stations = []
    @trains = []
    @coaches = []
    @routes = []
    choice = 42

    while choice do
      puts "Чтобы вы хотели сделать?"
      puts "-чтобы создать объект, наберите 1"
      puts "-чтобы управлять объектом, наберите 2"
      puts "-посмотреть списки созданых объектов, наберите 3"
      puts "-для выхода наберите 0"
      choice = gets.chomp.to_i

      case choice
      when 0
        choice = nil
      when 1
        menu_create
      when 2
        menu_work_with
      when 3
        menu_look_for
      end
    end
  end

  private
  def menu_create
    choice = 42

    while choice do
      puts "Какой объект вы бы хотели создать?"
      puts "-станция, наберите 1"
      puts "-поезд, набериете 2"
      puts "-вагон, наберите 3"
      puts "-маршрутный лист, наберите 4"
      puts "-для возврата в предыдущее меню наберите 0"    
      choice = gets.chomp.to_i

      case choice
      when 0
        choice = nil
      when 1
        menu_create_stations
      when 2
        menu_create_trains
      when 3
        menu_create_coaches
      when 4
        menu_create_routes
      end
    end
  end

  def menu_create_stations
    puts "Введите название станции:"
    name = gets.chomp.capitalize.to_s
    station = Station.new(name)
    @stations << station
    stations_list
  end

  def menu_create_trains
    choice = 42
 
    while choice do
      puts "Поезд какого типа выхотите создать?"
      puts "-пассажирский, наберите 1"
      puts "-грузовой, наберите 2"
      puts "-для возврата в предыдущее меню наберите 0"
      choice = gets.chomp.to_i

      case choice
      when 0
        choice = nil
      when 1
        make_train(PassengerTrain)
        trains_list
      when 2
        make_train(CargoTrain)
        trains_list
      end
    end 
  end

  def menu_create_coaches
    choice = 42

    while choice do
      puts "Вагон какого типа вы хотите создать?"
      puts "-пассажирский, наберите 1"
      puts "-грузовой, наберите 2"
      puts "-для возврата в предыдущее меню наберите 0"
      choice = gets.chomp.to_i

      case choice
      when 0
        choice = nil
      when 1
        make_coach(PassangerCoach)
        coaches_list
      when 2
        make_coach(CargoCoach)
        coaches_list
      end
    end
  end

  def menu_create_routes
    stations_list
    puts "Укажите начало маршрута."
    first = find_station
    puts "Укажите конец маршрута."
    last = find_station
    if first && last
      route = Route.new(first, last)
      route.put_list
      @routes << route
    else
      puts "Нельзя создавать пустой маршрут."      
    end
  end

  def menu_work_with
    choice = 42

    while choice do
      puts "Каким объектом управлять?"
      puts "-станция, наберите 1"
      puts "-поезд, набериете 2"
      puts "-маршрутный лист, наберите 3"
      puts "-для возврата в предыдущее меню наберите 0"
      choice = gets.chomp.to_i

      case choice
      when 0
        choice = nil
      when 1
        menu_work_with_stations
      when 2
        menu_work_with_trains
      when 3
        menu_work_with_routes
      end
    end
  end

  def menu_work_with_stations
    stations_list
    stop = find_station

    while stop do
      puts "Что будем делать?"
      puts "-посмотреть список поездов на станции, наберите 1"
      puts "-принять поезд на станцию, наберите 2"
      puts "-отправить поезд со станции, наберите 3"
      puts "-для возврата в предыдущее меню наберите 0"
      choice = gets.chomp.to_i
        
      case choice
      when 0
        stop = nil
      when 1
        choice = 42

        while choice do
          puts "Какой список будем смотреть?"
          puts "-общий, наберите 1"
          puts "-пассажирские поезда, наберите 2"
          puts "-грузовые поезда, наберите 3"
          puts "-для возврата в предыдущее меню наберите 0"
          choice = gets.chomp.to_i
            
          case choice
          when 0
            choice = nil
          when 1
            stop.trains
          when 2
            stop.by_type(PassengerTrain)
          when 3
            stop.by_type(CargoTrain)
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
  end

  def menu_work_with_trains
    trains_list
    train = find_train

    while train do
      puts "Что будем делать?"
      puts "-добавить вагон в состав, наберите 1"
      puts "-удалить вагон из состава, наберите 2"
      puts "-получить маршрутный лист, наберите 3"
      puts "-очистить маршрутный лист, наберите 4"
      puts "-отправитьс на следующую станцию, наберите 5"
      puts "-вернуться на предыдущую станцию, наберите 6"
      puts "-для возврата в предыдущее меню наберите 0"
      choice = gets.chomp.to_i

      case choice
      when 0
        train = nil
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
  end

  def menu_work_with_routes
    routes_list
    route = find_route

    while route do
      puts "Что делаем?"
      puts "-добавить станцию, наберите 1"
      puts "-удалить станцию, наберите 2"
      puts "-для возврата в предыдущее меню наберите 0"
      choice = gets.chomp.to_i
      
      case choice
      when 0
        route = nil
      when 1
        stations_list
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

  def menu_look_for
    choice = 42

    while choice do
      puts "-посмотреть список станций, наберите 1"
      puts "-посмотреть список поездов, наберите 2"
      puts "-посмотреть список вагонов, наберите 3"
      puts "-посмотреть список маршрутов, наберите 4"
      puts "-для возврата в предыдущее меню наберите 0"
      choice = gets.chomp.to_i

      case choice
      when 0
        choice = nil
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
    @coaches.each { |i| print "№#{i.number}: "; puts "Тип: #{i.type_check}" }
  end

  def routes_list
    puts "Список маршрутных листов:"
    @routes.each { |i| print "№#{@routes.index(i) + 1}:"; i.put_list }
  end

  def find_station
    puts "Выберите станцию."
    name = gets.chomp.capitalize.to_s
    return nil if name == "0"
      station = @stations.find { |i| i.name == name}
    return station if station

      puts "Такой станции нет в списке."
      find_station
  end

  def find_train
    puts "Введите номер поезда."
    number = gets.chomp.to_i
    return nil if number == 0
      train = @trains.find { |i| i.number == number}
    return train if train

      puts "Нет такого поезда."
      find_train
  end

  def find_coach
    puts "Введите номер вагона."
    number = gets.chomp.to_i
    return nil if number == 0
      coach = @coaches.find { |i| i.number == number }
    return coach if coach

      puts "Нет такого вагона." 
      find_coach  
  end

  def find_route
    puts "С каким № маршрутного листа работаем?"
    number = gets.chomp.to_i
    return nil if number <= 0
      route = @routes[number - 1]
    return route if route

      puts "Нет такого маршрутного листа."
      find_coach
  end

  def coaches_in_train(train)
    puts "Список вагонов в составе:"
    train.coaches.each { |i| puts i.number }
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
end
