puts "Задайте длинны сторон треугольника ABC."
print "AB: "
ab = gets.chomp.to_f

print "BC: "
bc = gets.chomp.to_f

print "CA: "
ca = gets.chomp.to_f

triangle = [ab, bc, ca].sort!

rectangular = if triangle[2]**2 == triangle[0]**2 + triangle[1]**2
  "прямоугольный"
else
  "не прямоугольный"
end


if ab == bc && ab == ca
  equilateral = "равносторонний, "
  isosceles = "равнобедренный, "
elsif ab == bc || ab == ca || bc ==ca
  isosceles = "равнобедренный, "   
end

puts "Треугольник: #{equilateral}#{isosceles}#{rectangular}."
