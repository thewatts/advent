module AdventOfCode
  module Day1
    extend self

    def from_next_item(input)
      validate_input(input)
      sum_digits_from_input(input, from_next: true)
    end

    def from_half(input)
      validate_input(input)
      digits = parse_digits(input)
      
      if digits.count.odd?
        raise ArgumentError, "Input must have an even number of digits for halfway comparison"
      end
      
      sum_digits_from_input(input, from_half: true)
    end

    private

    def validate_input(input)
      cleaned_input = input.to_s.strip
      
      if cleaned_input.empty?
        raise ArgumentError, "Input cannot be empty"
      end
      
      unless cleaned_input.match?(/\A\d+\z/)
        raise ArgumentError, "Input must contain only digits"
      end
    end

    def parse_digits(input)
      input.to_s.strip.split("").map(&:to_i)
    end

    def keep_from_half?(digit, index, digits)
      steps     = digits.count / 2
      candidate = digits.rotate(index + steps).first

      digit == candidate
    end

    def keep_from_next?(digit, index, digits)
      candidate = digits.rotate(index + 1).first

      digit == candidate
    end

    def sum_digits_from_input(input, from_half: false, from_next: false)
      digits = parse_digits(input)

      digits
        .each_with_object([])
        .with_index do |(digit, keepers), index|
          keepers << digit if from_half && keep_from_half?(digit, index, digits)
          keepers << digit if from_next && keep_from_next?(digit, index, digits)
        end.reduce(&:+) || 0
    end
  end
end
