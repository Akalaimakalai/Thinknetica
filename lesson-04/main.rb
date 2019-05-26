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
routes
choice = nil

while choice != 0 do
puts "Чтобы вы хотели сделать?"
puts "-чтобы создать объект наберите 1"
puts "-чтобы редактировать объект наберите 2"
puts "-чтобы управлять объектом наберите 3"
puts "-для выхода наберите 0"

choice = gets.chomp.to_i

case choice
when 1
  choice-1 = nil

  while choice-1 != 0 do
    puts "Какой объект вы бы хотели создать?"
    puts "-станция, наберите 1"
    puts "-поезд, набериете 2"
    puts "-вагон, наберите 3"
    puts "-маршрутный лист, наберите 4"
    puts "-для возврата в предыдущее меню наберите 0"    

    choice1 = gets.chomp.to_i

    case choice-1
    when 1
      puts "Введите название станции:"

      name = gets.chomp.to_s.capitalize!
      station = Station.new(name)
      stations << station
      stations.each { |i| puts i.name }

    when 2
      choice-1-2 = nil

      while choice-1-2 != 0 do
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
      choice-1-3 = nil
      while choice-1-3 != 0 do
        puts "Вагон какого типа вы хотите создать?"
        puts "-пассажирский, наберите 1"
        puts "-грузовой, наберите 2"
        puts "-для возврата в предыдущее меню наберите 0"

        choice-1-3 = gets.chomp.to_i

        case choise-1-3
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
      puts "Список доступныхстанций:"
      stations.each { |i| puts i.name }
      puts "Введите название начальной станции:"
      first = gets.chomp.to_s.capitalize!
      puts "Введите название конечной станции:"
      last = gets.chomp.to_s.capitalize!
      route = Route.new(first, last)
      routes << route
    end
  end
when 2
  puts "Какой объект вы бы хотели отредактировать?"
  puts "-станция, наберите 1"
  puts "-поезд, набериете 2"
  puts "-маршрутный лист, наберите 3"

  choice2 = gets.chomp.to_i

  case choice-2
  when 1
  when 2
  when 3
  when 4
  end
when 3
  puts "Каким объектом управлять?"
  puts "-станция, наберите 1"
  puts "-поезд, набериете 2"
  puts "-вагон, наберите 3"
  puts "-маршрутный лист, наберите 4"

  choice-3 = gets.chomp.to_i
    
  case choice-3
  when 1
  when 2
  when 3
  when 4
  end
end
end
