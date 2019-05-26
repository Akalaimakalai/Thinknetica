require_relative 'route'
require_relative 'train'
require_relative 'station'
require_relative 'passenger_coach'
require_relative 'passenger_train'
require_relative 'cargo_train'
require_relative 'cargo_coach'

train = Train.new(801)
trainP = PassengerTrain.new(16)
trainC = CargoTrain.new(20)
coach01 = CoachP.new(1001)
coach02 = CoachC.new(1002)
novog = Station.new("Новогиреево")
perovo = Station.new("Перово")
shosse = Station.new("Шоссе Энтузиастов")
motor = Station.new("Авиамоторная")
ploshad = Station.new("Площадь Ильича")
marks = Station.new("Maрксистская")
route = Route.new(novog, marks)

route.add(perovo)
route.add(shosse)
route.add(motor)
route.add(ploshad)

trainC.add_coach(coach01)
trainC.add_coach(coach02)
trainC.remove_coach(coach02)

trainC.add_route(route)

trainC.back
trainC.go
trainC.go
trainC.go
trainC.go
trainC.go
trainC.go
