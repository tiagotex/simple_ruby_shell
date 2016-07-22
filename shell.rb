require 'readline'

loop do
  input = Readline.readline('> ', true)

  break                       if input == 'exit'
  puts Readline::HISTORY.to_a if input == 'hist'

  Readline::HISTORY.pop       if input.empty?

  system(input)
end
