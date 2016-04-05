# one_direction = [["Niall", 22], ["Liam", 22], ["Harry", 22], ["Louis", 24], ["Zayn", 23]]
#
#
# oldest = one_direction.max_by {|member| member[1]}
# puts "#{oldest[0]} is the oldest."
#
# first_alpha = one_direction.min_by {|member| member[0]}
# puts "#{first_alpha[0]} is the first alphabetically."
#
# youngest = one_direction.min_by {|member| member[1]}
# puts "#{youngest[0]} is the youngest."

# descending = one_direction.sort_by {|member| member[1]}
# puts descending.reverse.inspect
animals = ["dog", "cat", "pug", "hippopotamus"]

one_h = animals.one? {|animal| animal[0] == "h"}
puts one_h
