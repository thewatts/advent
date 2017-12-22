module AdventOfCode
  module Day1
    extend self

    def from_next_item(input)
      digits = input.to_s.strip.split("").map(&:to_i)

      digits
        .each_with_object([])
        .with_index do |(digit, keepers), index|
          keepers << digit if keep_from_next?(digit, index, digits)
        end.reduce(&:+) || 0
    end

    def from_half(input)
      digits = input.to_s.strip.split("").map(&:to_i)

      digits
        .each_with_object([])
        .with_index do |(digit, keepers), index|
          keepers << digit if keep_from_half?(digit, index, digits)
        end.reduce(&:+) || 0
    end

    private

    def keep_from_next?(digit, index, digits)
      candidate = digits[index + 1]

      digit == candidate || (candidate.nil? && digit == digits.first)
    end

    def keep_from_half?(digit, index, digits)
      count = digits.count
      steps = count / 2

      candidate = digits.rotate(index).rotate(steps).first

      digit == candidate
    end
  end
end
