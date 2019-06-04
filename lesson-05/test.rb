#require_relative 'route'
require_relative 'train'
require_relative 'passenger_train'
require_relative 'cargo_train'
require_relative 'station'


tr1 = PassengerTrain.new(101)
tr2 = CargoTrain.new(201)
tr3 = Train.new(801)


tr3.add_company("РосЖопДев")
puts tr3.company_name

puts Train.find(801)

puts PassengerTrain.instances
puts CargoTrain.instances
puts Train.instances

tr4 = Train.new(434)

puts PassengerTrain.instances
puts CargoTrain.instances
puts Train.instances

tr5 = Train.new(567)

puts PassengerTrain.instances
puts CargoTrain.instances
puts Train.instances


st1 = Station.new("First")
st2 = Station.new("Second")

Station.all

=begin
require_relative 'coach'
require_relative 'station'
require_relative 'passenger_coach'
require_relative 'passenger_train'
require_relative 'cargo_train'
require_relative 'cargo_coach'
require_relative 'company'
require_relative 'instance_counter'
=end
