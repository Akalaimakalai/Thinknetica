vowels_hash = Hash.new
vowels_array = [:a, :e, :i, :o, :u]
num = 0

(:a..:z).each do |i| num +=1
  if vowels_array.include? (i)
    vowels_hash[i] = num
  end
end

print vowels_hash
