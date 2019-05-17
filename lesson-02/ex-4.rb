vowels_hash = {}
vowels_array = [:a, :e, :i, :o, :u]

(:a..:z).each.with_index(1) do |sym, index|  
  vowels_hash[sym] = index if vowels_array.include? (sym)
end

print vowels_hash
