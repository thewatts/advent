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
    end
  end
end
