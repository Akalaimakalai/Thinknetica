puts "Введите коэффициенты квадратного уравнения."
print "a:"
a = gets.chomp.to_f
print "b:"
b = gets.chomp.to_f
print "c:"
c = gets.chomp.to_f

dis = b**2 - (4 * a * c)

puts "Дискриминант = #{dis}"

if dis > 0
  root = Math.sqrt(dis)
  x1 = (-b + root) / (2 * a)
  x2 = (-b - root) / (2 * a)
  puts "x1 = #{x1}, x2 = #{x2}"
elsif dis == 0
  x = -b / (2 * a)
  puts "x1 = x2 = #{x}"
else
  puts "Корней нет."
end
