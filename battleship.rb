require "./lib/repl"
require "./lib/engine"


repl = Repl.new
engine = Engine.new


quit = false

while quit == false
  print repl.opening_text
  answer = gets.chomp.downcase

  if answer == 'p' || answer == 'play'

    quit = engine.play
    
  elsif answer == 'i' || answer == 'instructions'
    puts repl.load_instructions
  elsif answer == 'q' || answer == 'quit'
    quit = true
  end
end
