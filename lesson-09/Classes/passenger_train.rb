# frozen_string_literal: true

class PassengerTrain < Train
  TYPE = 'пассажирский'.freeze

  def add_coach(coach)
    raise if coach.class != PassengerCoach

    super
  end
end
