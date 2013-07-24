def combine_anagrams(words)
 words.group_by { |s| s.downcase.split("").sort.join }.values
end

ary = ['Cars', 'for', 'potatoes', 'Racs', 'four', 'scar', 'creams', 'scream'] 
p combine_anagrams(ary)