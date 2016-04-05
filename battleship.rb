require "./lib/repl"

repl = Repl.new
quit = false

while quit == false
  print repl.opening_text
  answer = gets.chomp.downcase

  if answer == 'p' || answer == 'play'
    # Play game
  elsif answer == 'i' || answer == 'instructions'
    puts repl.load_instructions
  elsif answer == 'q' || answer == 'quit'
    quit = true
  end
end
