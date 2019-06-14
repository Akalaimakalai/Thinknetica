module Create
  private
  
  def menu_create(*)
    ways = {
      0 => 'main_menu',
      1 => 'menu_create_stations',
      2 => 'menu_create_trains',
      3 => 'menu_create_coaches',
      4 => 'menu_create_routes'
    }

    puts 'Какой объект вы бы хотели создать?'
    puts '-станция, наберите 1'
    puts '-поезд, набериете 2'
    puts '-вагон, наберите 3'
    puts '-маршрутный лист, наберите 4'
    puts '-для возврата в предыдущее меню наберите 0'
    choice = gets.chomp.to_i
    send(ways[choice]) if ways.include?(choice)
    menu_create
  end

  def menu_create_stations
    puts 'Введите название станции (от 5 до 20 символов):'
    name = gets.chomp.capitalize.to_s
    return menu_create if name == '0'

    station = Station.new(name)
    @stations << station
    stations_list
    menu_create
  rescue RuntimeError
    puts 'Недопустимое имя станции.'
    retry
  end

  def menu_create_trains
    ways = {
      0 => ['menu_create'],
      1 => ['make_train', PassengerTrain],
      2 => ['make_train', CargoTrain]
    }

    puts 'Поезд какого типа выхотите создать?'
    puts '-пассажирский, наберите 1'
    puts '-грузовой, наберите 2'
    puts '-для возврата в предыдущее меню наберите 0'
    choice = gets.chomp.to_i
    send(ways[choice][0], *ways[choice][1]) if ways.include?(choice)
    menu_create_trains
  end

  def menu_create_coaches
    ways = {
      0 => ['menu_create'],
      1 => ['make_coach', PassengerCoach],
      2 => ['make_coach', CargoCoach]
    }

    puts 'Вагон какого типа вы хотите создать?'
    puts '-пассажирский, наберите 1'
    puts '-грузовой, наберите 2'
    puts '-для возврата в предыдущее меню наберите 0'
    choice = gets.chomp.to_i
    send(ways[choice][0], *ways[choice][1]) if ways.include?(choice)
    menu_create_coaches
  end

  def menu_create_routes
    stations_list
    puts 'Укажите начало маршрута.'
    first = find_station
    puts 'Укажите конец маршрута.'
    last = find_station
    if first && last
      route = Route.new(first, last)
      route.put_list
      @routes << route
    else
      puts 'Нельзя создавать пустой маршрут.'
    end
    menu_create
  end

  def make_train(type)
    puts 'Введите номер поезда (примеры: 713-Еж, 77742, ГрИшА)'
    number = gets.chomp.to_s
    train = type.new(number)
    @trains << train
    trains_list
  rescue RuntimeError
    puts "Номер не соответствует ГОСТ'у"
    retry
  end

  def make_coach(type)
    input = coach_input(type)
    coach = type.new(input[0], input[1])
    puts "Создан вагон за №#{coach.number}:"
    puts "Тип: #{coach.type} "
    coach.additional
    @coaches << coach
    coaches_list
  rescue RuntimeError
    puts "Номер не соответствует ГОСТ'у"
    retry
  end
end
