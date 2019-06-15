# frozen_string_literal: true

module LookFor
  private

  def menu_look_for
    ways = {
      0 => 'main_menu',
      1 => 'stations_list',
      2 => 'trains_list',
      3 => 'coaches_list',
      4 => 'routes_list'
    }

    puts '-посмотреть список станций, наберите 1'
    puts '-посмотреть список поездов, наберите 2'
    puts '-посмотреть список вагонов, наберите 3'
    puts '-посмотреть список маршрутов, наберите 4'
    puts '-для возврата в предыдущее меню наберите 0'
    choice = gets.chomp.to_i
    send(ways[choice]) if ways.include?(choice)
    menu_look_for
  end

  def stations_list
    puts 'Список доступных станций:'
    @stations.each { |i| puts i.name }
  end

  def trains_list
    puts 'Список доступных поездов:'
    @trains.each { |i| puts i.number }
  end

  def coaches_list
    puts 'Список доступных вагонов:'
    @coaches.each do |i|
      print "№#{i.number}: "
      print "Тип: #{i.type} "
      i.additional
    end
  end

  def routes_list
    puts 'Список маршрутных листов:'
    @routes.each do |i|
      print "№#{@routes.index(i) + 1}:"
      i.put_list
    end
  end

  def find_station
    puts 'Выберите станцию.'
    name = gets.chomp.capitalize.to_s
    return nil if name == '0'

    station = @stations.find { |i| i.name == name }
    return station if station

    puts 'Такой станции нет в списке.'
    find_station
  end

  def find_train
    puts 'Введите номер поезда.'
    number = gets.chomp
    return nil if number.to_i.zero?

    train = @trains.find { |i| i.number == number }
    return train if train

    puts 'Нет такого поезда.'
    find_train
  end

  def find_coach
    puts 'Введите номер вагона.'
    number = gets.chomp
    return nil if number.to_i.zero?

    coach = @coaches.find { |i| i.number == number }
    return coach if coach

    puts 'Нет такого вагона.'
    find_coach
  end

  def find_route
    puts 'С каким № маршрутного листа работаем?'
    number = gets.chomp.to_i
    return nil if number <= 0

    route = @routes[number - 1]
    return route if route

    puts 'Нет такого маршрутного листа.'
    find_coach
  end

  def coaches_in_train(train)
    puts 'Список вагонов в составе:'

    train.each_carriage do |i|
      print "№#{i.number} "
      puts "Тип:#{i.type}"
      i.free
      i.engaged
    end
  end

  def coach_input(type)
    puts 'Введите номер вагона (Пример: 123456)'
    number = gets.chomp
    puts 'Укажите число пассажирских мест' if type == PassengerCoach
    puts 'Укажите нормированный объеём груза' if type == CargoCoach
    additional = gets.chomp.to_i
    [number, additional]
  end
end
