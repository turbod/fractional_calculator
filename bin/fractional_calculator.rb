#!/usr/bin/env ruby
# frozen_string_literal: true

require 'readline'
require_relative '../lib/fractional/validator'
require_relative '../lib/fractional/calculator'
require_relative '../lib/fractional/formatter'

PROMPT = '? '

puts "Type 'exit' if you want to quit."
puts 'Type fractional numbers and the operator.'
puts 'For example:'
puts '1&1/2 + 1/2'

if $PROGRAM_NAME == __FILE__
  while (cli_input = Readline.readline(PROMPT, true))
    exit if cli_input == 'exit'

    if Fractional::Validator.validate(cli_input)
      first_operand, operator, second_operand = cli_input.split(/\s+/)

      result = Fractional::Calculator.calculate!(
        operator,
        Fractional::Formatter.to_fractional(first_operand),
        Fractional::Formatter.to_fractional(second_operand)
      )
      puts Fractional::Formatter.to_quest(result)
    else
      puts 'Invalid input'
    end
  end
end
