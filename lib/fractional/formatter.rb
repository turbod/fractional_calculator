# frozen_string_literal: true

module Fractional
  # Format Rational numbers to or from the Quest format
  #
  # Example:
  # Fractional::Formatter.to_fractional('3&3/4')
  # Fractional::Formatter.to_quest('11/4')
  class Formatter
    DIVIDER = '&'

    class << self
      def to_fractional(input)
        parse(input)
      end

      def to_quest(input)
        return input.to_s if input.to_s.include? DIVIDER

        rational_number = Rational(input)
        return rational_number.to_s if rational_number >= -1 && rational_number <= 1

        negative = rational_number.negative?
        rational_number = rational_number.abs

        whole_part = rational_number.numerator / rational_number.denominator
        fractional_part = rational_number.numerator % rational_number.denominator

        "#{negative ? '-' : nil}#{whole_part}#{DIVIDER}#{fractional_part}/#{rational_number.denominator}"
      end

      private

      def parse(input)
        parts = input.split DIVIDER
        if parts.size == 1
          Rational(parts.last)
        else
          rational_number = Rational(parts.last)
          Rational(parts.first.to_i * rational_number.denominator + rational_number.numerator,
                   rational_number.denominator)
        end
      end
    end
  end
end
