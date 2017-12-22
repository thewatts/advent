module AdventOfCode
  module Day1
    extend self

    def from_next_item(input)
      sum_digits_from_input(input, from_next: true)
    end

    def from_half(input)
      sum_digits_from_input(input, from_half: true)
    end

    private

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
      digits = input.to_s.strip.split("").map(&:to_i)

      digits
        .each_with_object([])
        .with_index do |(digit, keepers), index|
          keepers << digit if from_half && keep_from_half?(digit, index, digits)
          keepers << digit if from_next && keep_from_next?(digit, index, digits)
        end.reduce(&:+) || 0
    end
  end
end
