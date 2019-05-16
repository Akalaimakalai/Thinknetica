array = [0, 1]

loop do
  i = array[array.length - 1] + array[array.length - 2]
  if i < 100
    array.push(i)
  else
    break
  end
end

print array
