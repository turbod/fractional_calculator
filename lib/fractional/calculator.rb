# frozen_string_literal: true

module Fractional
  # Calculate the result
  #
  # Example:
  # puts Fractional::Calculator.calculate!('+', Rational('3/4'), Rational('3/2'))
  class Calculator

    def self.calculate!(operator, first_operand, second_operand)
      case operator
      when '*' then first_operand * second_operand
      when '+' then first_operand + second_operand
      when '-' then first_operand - second_operand
      when '/' then first_operand / second_operand
      else
        raise "The '#{operator}' operator is not supported!"
      end
    end
  end
end