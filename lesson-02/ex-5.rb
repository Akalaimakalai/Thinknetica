months = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]

puts "Пожалуйста введите дату в формате дд.мм.гггг"
date = gets.chomp

day, month, year = date.split(".")

if year.to_i % 400 == 0 || (year.to_i % 100 != 0 && year.to_i % 4 == 0)

  months [1] = 29

end

days_gone = 0
months_gone = month.to_i - 2
 
months[0..months_gone].each { |i| days_gone +=i }

count = day.to_i + days_gone

puts "С начала года прошло #{count} дней."
