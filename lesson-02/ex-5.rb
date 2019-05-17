months = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]

puts "Пожалуйста введите дату в формате дд.мм.гггг"
date = gets.chomp

date_array = date.split(".")

if date_array[2].to_i % 400 == 0 || (date_array[2].to_i % 100 != 0 && date_array[2].to_i % 4 == 0)

  months [1] = 29

end

days_gone = 0
months_gone = date_array[1].to_i - 2
 
months[0..months_gone].each {|i| days_gone +=i}

count = date_array[0].to_i + days_gone

puts "С начала года прошло #{count} дней."
