require 'readline'

complete = proc do |s|
  directory_list = Dir.glob("#{s}*")

  if !directory_list.empty?
    directory_list
  else
    Readline::HISTORY.grep(/^#{Regexp.escape(s)}/)
  end
end

Readline.completion_append_character = ' '
Readline.completion_proc = complete

loop do
  input = Readline.readline('> ', true)

  break                       if input == 'exit'
  puts Readline::HISTORY.to_a if input == 'hist'

  Readline::HISTORY.pop       if input.empty?

  system(input)
end

# Execute the command in another process to keep the shell alive
def system(command)
  fork do
    exec(command)
  end
end
