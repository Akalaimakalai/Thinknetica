puts "Здравствуй, как тебя зовут?"
name = gets.chomp
puts "Приятно познакомиться, #{name}. А сколько ты ростом?"
height = gets.chomp.to_i

weight = height - 110

if weight < 0 
  puts "Ваш вес уже оптимальный"
else 
  puts "#{name}, твой идеальный вес: #{weight} кг."
end
