# frozen_string_literal: true

class CargoCoach < Coach
  TYPE = 'грузовой'

  def free
    puts "Свободно #{@additional - @engaged} куб.м."
  end

  def engaged
    puts "Занято #{@engaged} куб.м."
  end

  def additional
    puts "Объём: #{@additional}куб.м."
  end
end
