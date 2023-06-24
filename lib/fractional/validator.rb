# frozen_string_literal: true

module Fractional
  # Validate user input
  class Validator
    DIVIDER = '&'
    NUMBER_REGEXP = '((?:[+-])?(?:[1-9]+\&)?(?:[1-9][0-9]*\/)?[1-9][0-9]*)'

    class << self
      def validate(input)
        match_data = input.match(%r{^#{NUMBER_REGEXP} [-+*/] #{NUMBER_REGEXP}})
        !match_data.nil?
      end
    end
  end
end