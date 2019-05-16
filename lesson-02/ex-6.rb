list = Hash.new
total = 0

loop do 
  puts "Введите название товара, цену и колличество товара в формате название/цена/кол-во. Введите 'стоп', чтобы закончить список."
  string = gets.chomp
  if string == "стоп"
    break
  end

  goods = string.split("/")
  item = Hash.new

  item[goods[1].to_f] = goods[2].to_f

  list[goods[0]] = item

  cost = goods[1].to_f * goods[2].to_f

  puts "За #{goods[0]} заплатим #{cost} руб."

  total += cost

end

puts "Итого: #{total} руб. за"
print list
