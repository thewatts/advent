module AdventOfCode
  module Day1
    extend self

    def call(input)
      digits = input.to_s.strip.split("").map(&:to_i)

      digits
        .each_with_object([])
        .with_index do |(digit, keepers), index|
          keepers << digit if keep?(digit, index, digits)
        end.reduce(&:+) || 0
    end

    private

    def keep?(digit, index, digits)
      candidate = digits[index + 1]

      digit == candidate || (candidate.nil? && digit == digits.first)
    end
  end
end
