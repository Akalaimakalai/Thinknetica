# frozen_string_literal: true

class Menu
  require_relative 'Classes/route'
  require_relative 'Classes/train'
  require_relative 'Classes/coach'
  require_relative 'Classes/station'
  require_relative 'Classes/passenger_coach'
  require_relative 'Classes/passenger_train'
  require_relative 'Classes/cargo_train'
  require_relative 'Classes/cargo_coach'

  require_relative 'Modules/Menu/create'
  require_relative 'Modules/Menu/work'
  require_relative 'Modules/Menu/look_for'

  include Create
  include Work
  include LookFor

  def start
    @stations = []
    @trains = []
    @coaches = []
    @routes = []

    main_menu
  end

  private

  def main_menu
    ways = {
      0 => 'bye',
      1 => 'menu_create',
      2 => 'menu_work_with',
      3 => 'menu_look_for'
    }

    puts 'Чтобы вы хотели сделать?'
    puts '-чтобы создать объект, наберите 1'
    puts '-чтобы управлять объектом, наберите 2'
    puts '-посмотреть списки созданых объектов, наберите 3'
    puts '-для выхода наберите 0'
    choice = gets.chomp.to_i
    send(ways[choice]) if ways.include?(choice)
    main_menu
  end

  def bye
    puts 'Пока!'
    exit
  end
end
