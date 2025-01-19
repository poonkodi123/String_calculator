require 'rails_helper'

RSpec.describe StringCalculator, type: :service do
  describe '.calculate' do
    it 'returns 0 for an empty string' do
      expect(StringCalculator.calculate("")).to eq(0)
    end

    it 'returns the number when given a single number' do
      expect(StringCalculator.calculate("1")).to eq(1)
    end

    it 'returns the sum of two numbers' do
      expect(StringCalculator.calculate("1,2")).to eq(3)
    end

    it 'returns the sum of multiple numbers' do
      expect(StringCalculator.calculate("1,2,3")).to eq(6)
    end

    it 'handles newlines as separators' do
      expect(StringCalculator.calculate("1\n2,3")).to eq(6)
    end

    it 'Need to throws an exception for negative numbers' do
      expect { StringCalculator.calculate("1,-2,3") }.to raise_error("Negatives not allowed: -2")
    end

    it 'remove custom delimiters' do
      expect(StringCalculator.calculate("//;\n1;2;3")).to eq(6)
    end
  end
end
