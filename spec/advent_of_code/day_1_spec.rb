require "spec_helper"
require "./lib/advent_of_code/day_1"

module AdventOfCode
  RSpec.describe Day1 do
    describe "#from_next_item" do
      context "1122" do
        it "produces a sum of 3" do
          expect(Day1.from_next_item(1122)).to eq 3
        end
      end

      context "1111" do
        it "produces a sum of 4" do
          expect(Day1.from_next_item(1111)).to eq 4
        end
      end

      context "1234" do
        it "produces a sum of 0" do
          expect(Day1.from_next_item(1234)).to eq 0
        end
      end

      context "91212129" do
        it "produces a sum of 9" do
          expect(Day1.from_next_item(91212129)).to eq 9
        end
      end

      context "puzzle input" do
        let(:puzzle_input) { File.read("./spec/support/fixtures/day-1.txt") }

        it "produces the correct sum" do
          expect(Day1.from_next_item(puzzle_input)).to eq 1029
        end
      end

      context "input with non-numeric characters" do
        it "should raise an error for invalid input" do
          expect { Day1.from_next_item("1a1") }.to raise_error(ArgumentError, "Input must contain only digits")
        end
      end

      context "empty input" do
        it "should raise an error for empty input" do
          expect { Day1.from_next_item("") }.to raise_error(ArgumentError, "Input cannot be empty")
        end
      end

      context "whitespace only input" do
        it "should raise an error for whitespace only input" do
          expect { Day1.from_next_item("   ") }.to raise_error(ArgumentError, "Input cannot be empty")
        end
      end
    end

    describe "#from_half" do
      context "1212" do
        it "produces a sum of 6" do
          expect(Day1.from_half(1212)).to eq 6
        end
      end

      context "1221" do
        it "produces a sum of 0" do
          expect(Day1.from_half(1221)).to eq 0
        end
      end

      context "123425" do
        it "produces a sum of 4" do
          expect(Day1.from_half(123425)).to eq 4
        end
      end

      context "123123" do
        it "produces a sum of 12" do
          expect(Day1.from_half(123123)).to eq 12
        end
      end

      context "12131415" do
        it "produces a sum of 4" do
          expect(Day1.from_half(12131415)).to eq 4
        end
      end

      context "puzzle input" do
        let(:puzzle_input) { File.read("./spec/support/fixtures/day-1.txt") }

        it "produces the correct sum" do
          expect(Day1.from_half(puzzle_input)).to eq 1220
        end
      end

      context "odd-length input" do
        it "should raise an error for odd-length input" do
          # Advent of Code Day 1 Part 2 requires even-length input for halfway comparison
          expect { Day1.from_half("12345") }.to raise_error(ArgumentError, "Input must have an even number of digits for halfway comparison")
        end
      end

      context "input validation" do
        it "should raise an error for non-numeric input" do
          expect { Day1.from_half("12a34") }.to raise_error(ArgumentError, "Input must contain only digits")
        end

        it "should raise an error for empty input" do
          expect { Day1.from_half("") }.to raise_error(ArgumentError, "Input cannot be empty")
        end
      end
    end
  end
end
