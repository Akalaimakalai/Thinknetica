list = {}
cost = 0
total = 0

loop do 
  puts "Введите название товара, цену и колличество товара в формате название/цена/кол-во. Введите 'стоп', чтобы закончить список."
  string = gets.chomp
  if string == "стоп"
    break
  end

  name, price, quantity = string.split("/")
  item = {}

  item[price.to_f] = quantity.to_f

  list[name] = item
end

list.each do |key, val| 

  list[key].each do |price, quantity|

    cost = quantity * price

     puts "#{key}: #{cost} руб." 

    end
  total += cost
end

puts "Итого: #{total} руб."
