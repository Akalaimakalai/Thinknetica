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
  item = {
    price: 0,
    quantity: 0
  }

  item[:price] = price.to_f
  item[:quantity] = quantity.to_f
  list[name] = item
end

list.each do |key, val| 
    cost = list[key][:price] * list[key][:quantity]
     puts "#{key}: #{cost} руб." 
  total += cost
end

puts "Итого: #{total} руб."
