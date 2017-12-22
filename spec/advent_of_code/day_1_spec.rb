require "spec_helper"
require "./lib/advent_of_code/day_1"

module AdventOfCode
  RSpec.describe Day1 do
    describe "#call" do
      context "1122" do
        it "produces a sum of 3" do
          expect(Day1.call(1122)).to eq 3
        end
      end

      context "1111" do
        it "produces a sum of 4" do
          expect(Day1.call(1111)).to eq 4
        end
      end

      context "1234" do
        it "produces a sum of 0" do
          expect(Day1.call(1234)).to eq 0
        end
      end

      context "91212129" do
        it "produces a sum of 9" do
          expect(Day1.call(91212129)).to eq 9
        end
      end

      context "puzzle input" do
        let(:puzzle_input) { File.read("./spec/support/fixtures/day-1.txt") }

        it "produces the correct sum" do
          expect(Day1.call(puzzle_input)).to eq 1029
        end
      end
    end
  end
end
