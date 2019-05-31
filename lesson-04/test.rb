class Test
  def find_train
    puts "Введите номер поезда."
    number = gets.chomp.to_i
    break if number == 0
    train = number
    return train if train
  
    puts "Нет такого поезда."
    find_train
  end
end

