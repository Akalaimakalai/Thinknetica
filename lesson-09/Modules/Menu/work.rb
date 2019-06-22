# frozen_string_literal: true

module Work
  private

  def menu_work_with(*)
    ways = {
      0 => 'main_menu',
      1 => 'menu_work_with_stations',
      2 => 'menu_work_with_trains',
      3 => 'menu_work_with_coaches',
      4 => 'menu_work_with_routes'
    }

    puts 'Каким объектом управлять?'
    puts '-станция, наберите 1'
    puts '-поезд, набериете 2'
    puts '-вагон, наберите 3'
    puts '-маршрутный лист, наберите 4'
    puts '-для возврата в предыдущее меню наберите 0'
    choice = gets.chomp.to_i

    send(ways[choice]) if ways.include?(choice)
    menu_work_with
  end

  def menu_work_with_stations(*)
    stations_list
    stop = find_station
    return menu_work_with unless stop

    ways = {
      0 => 'menu_work_with',
      1 => 'menu_station_lists',
      2 => 'take_train',
      3 => 'free_train'
    }

    puts 'Что будем делать?'
    puts '-посмотреть список поездов на станции, наберите 1'
    puts '-принять поезд на станцию, наберите 2'
    puts '-отправить поезд со станции, наберите 3'
    puts '-для возврата в предыдущее меню наберите 0'
    choice = gets.chomp.to_i

    send(ways[choice]) if ways.include?(choice)
    menu_work_with_stations
  end

  def take_train
    trains_list
    express = find_train
    return menu_work_with_stations if express.nil?

    stop.take(express)
  end

  def free_train
    stop.trains
    express = find_train
    return menu_work_with_stations if express.nil?

    stop.free(express)
  end

  def menu_station_lists
    ways = {
      0 => ['menu_work_with_stations'],
      1 => ['trains'],
      2 => ['by_type', PassengerTrain],
      3 => ['by_type', CargoTrain]
    }

    puts 'Какой список будем смотреть?'
    puts '-общий, наберите 1'
    puts '-пассажирские поезда, наберите 2'
    puts '-грузовые поезда, наберите 3'
    puts '-для возврата в предыдущее меню наберите 0'
    choice = gets.chomp.to_i

    stop.send(ways[choice][0], *ways[choice][1]) if ways.include?(choice)
    menu_create_trains
  end

  def menu_work_with_trains
    trains_list
    train = find_train
    return menu_work_with unless train

    train_redact(train)
  end

  def train_redact(train)
    ways = {
      0 => 'menu_work_with',
      1 => 'coaches_in_train',
      2 => 'add_carriage',
      3 => 'remove_carriage',
      4 => 'give_route',
      5 => 'clear_route',
      6 => 'train_go',
      7 => 'train_back'
    }

    puts 'Что будем делать?'
    puts '-список вогонов в составе, наберите 1'
    puts '-добавить вагон в состав, наберите 2'
    puts '-удалить вагон из состава, наберите 3'
    puts '-получить маршрутный лист, наберите 4'
    puts '-очистить маршрутный лист, наберите 5'
    puts '-отправиться на следующую станцию, наберите 6'
    puts '-вернуться на предыдущую станцию, наберите 7'
    puts '-для возврата в предыдущее меню наберите 0'
    choice = gets.chomp.to_i

    send(ways[choice], *train) if ways.include?(choice)
    train_redact(train)
  end

  def add_carriage(train)
    coaches_list
    carriage = find_coach
    begin
      train.add_coach(carriage) if carriage
      coaches_in_train(train)
    rescue RuntimeError
      puts 'Неправильный тип вагона.'
    end
  end

  def remove_carriage(train)
    coaches_in_train(train)
    carriage = find_coach
    train.remove_coach(carriage) if train.coaches.include?(carriage)
  end

  def give_route(train)
    routes_list
    way = find_route
    train.add_route(way) if way
  end

  def clear_route(train)
    if train.route.length >= 2
      train.remove_route
      puts 'Маршрутный лист очищен.'
    else
      puts 'Маршрутный лист не задан.'
    end
  end

  def train_go(train)
    if train.next_station
      train.go
    else
      puts 'Конечная.'
    end
  end

  def train_back(train)
    if train.current_station == train.route.list[0]
      puts 'Конечная.'
    else
      train.back
    end
  end

  def menu_work_with_coaches
    coaches_list
    carriage = find_coach
    return menu_work_with unless carriage

    carriage.free
    coach_redact(carriage)
  end

  def coach_redact(carriage)
    ways = {
      0 => 'menu_work_with',
      1 => 'carriage_fill'
    }

    puts 'Что будем делать?'
    puts '-погрузка груза/посадка пассажира, наберите 1'
    puts '-для возврата в предыдущее меню наберите 0'
    choice = gets.chomp.to_i

    send(ways[choice], *carriage) if ways.include?(choice)
    coach_redact(carriage)
  end

  def carriage_fill(carriage)
    if carriage.class == PassengerCoach
      carriage.fill
    else
      puts 'Какой объём груза?'
      value = gets.chomp.to_i
      carriage.fill(value)
    end
  end

  def menu_work_with_routes
    routes_list
    route = find_route
    route_redact(route)
  end

  def route_redact(route)
    ways = {
      0 => 'menu_work_with',
      1 => 'route_add',
      2 => 'route_del'
    }

    puts 'Что делаем?'
    puts '-добавить станцию, наберите 1'
    puts '-удалить станцию, наберите 2'
    puts '-для возврата в предыдущее меню наберите 0'
    choice = gets.chomp.to_i

    send(ways[choice], *route) if ways.include?(choice)
    route_redact
  end

  def route_add(route)
    stations_list
    stop = find_station
    route.add(stop)
    puts 'Такая станция уже есть.' if route.add(stop).nil?
    route.put_list
  end

  def route_del(route)
    route.put_list
    stop = find_station
    route.remove(stop)
    puts 'Такой станции в списке нет, либо она одна из конечных.' if route.remove(stop).nil?
    route.put_list
  end
end
