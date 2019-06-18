# frozen_string_literal: true

class PassengerCoach < Coach
  TYPE = 'пассажирский'.freeze

  def free
    puts "Осталось #{@additional - @engaged} свободных мест."
  end

  def engaged
    puts "Занято #{@engaged} мест."
  end

  def additional
    puts "Мест: #{@additional}"
  end
end
