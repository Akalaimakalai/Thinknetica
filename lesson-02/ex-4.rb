vowels_hash = {}
vowels_array = [:a, :e, :i, :o, :u]

(:a..:z).each.with_index do |sym, index|
  
  vowels_hash[sym] = index + 1 if vowels_array.include? (sym)
  
end

print vowels_hash
