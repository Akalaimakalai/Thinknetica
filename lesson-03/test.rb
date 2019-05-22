require_relative 'route'
require_relative 'train'
require_relative 'station'

train = Train.new(801, "пассажирский", 8)
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

train.add_route(route)

train.back
train.go
train.go
train.go
train.go
train.go
train.go
train.go

