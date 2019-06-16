# frozen_string_literal: true

class CargoTrain < Train
  TYPE = 'грузовой'.freeze

  def add_coach(coach)
    raise if coach.class != CargoCoach

    super
  end
end
