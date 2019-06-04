require_relative 'route'
require_relative 'train'
require_relative 'coach'
require_relative 'station'
require_relative 'passenger_coach'
require_relative 'passenger_train'
require_relative 'cargo_train'
require_relative 'cargo_coach'
require_relative 'company'
require_relative 'instance_counter'

tr1 = PassengerTrain.new(101)
tr2 = CargoTrain.new(201)
tr3 = Train.new(801)


tr1.add_company("РосЖопДев")
puts tr1.company_name

puts Train.find(801)

Train.instances
