#!/usr/bin/env ruby
# frozen_string_literal: true

require 'readline'

PROMPT = '? '

puts "Type 'exit' if you want to quit."
puts 'Type fractional numbers and the operator.'
puts 'For example:'
puts '1&1/2 + 1/2'

if $PROGRAM_NAME == __FILE__
  while (cli_input = Readline.readline(PROMPT, true))
    exit if cli_input == 'exit'

    puts cli_input
  end
end
