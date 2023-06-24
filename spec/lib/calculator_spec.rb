# frozen_string_literal: true

require 'fractional/calculator'

RSpec.describe Fractional::Calculator, "#calculator" do
  context "valid input" do
    context "add" do
      it "less than 1" do
        expect(Fractional::Calculator.calculate!('+', Rational('3/4'), Rational('1/2'))).to eq(Rational('5/4'))
      end

      it "less than 1, greater than -1" do
        expect(Fractional::Calculator.calculate!('+', Rational('3/4'), Rational('-1/2'))).to eq(Rational('1/4'))
        expect(Fractional::Calculator.calculate!('+', Rational('3/4'), Rational('-3/2'))).to eq(Rational('-3/4'))
      end

      it "2 negative number" do
        expect(Fractional::Calculator.calculate!('+', Rational('-3/4'), Rational('-1/2'))).to eq(Rational('-5/4'))
      end

      it "integers" do
        expect(Fractional::Calculator.calculate!('+', Rational('-3'), Rational('2'))).to eq(Rational('-1'))
      end
    end

    context "subtract" do
      it "less than 1" do
        expect(Fractional::Calculator.calculate!('-', Rational('3/4'), Rational('1/2'))).to eq(Rational('1/4'))
      end

      it "less than 1, greater than -1" do
        expect(Fractional::Calculator.calculate!('-', Rational('3/4'), Rational('-1/2'))).to eq(Rational('5/4'))
        expect(Fractional::Calculator.calculate!('-', Rational('3/4'), Rational('-3/2'))).to eq(Rational('9/4'))
      end

      it "2 negative number" do
        expect(Fractional::Calculator.calculate!('-', Rational('-3/4'), Rational('-1/2'))).to eq(Rational('-1/4'))
      end

      it "integers" do
        expect(Fractional::Calculator.calculate!('-', Rational('-3'), Rational('2'))).to eq(Rational('-5'))
      end
    end

    context "divide" do
      it "zero division" do
        expect { Fractional::Calculator.calculate!('/', Rational('-3/4'), 0) }.to raise_error(ZeroDivisionError)
      end

      it "less than 1" do
        expect(Fractional::Calculator.calculate!('/', Rational('3/4'), Rational('1/2'))).to eq(Rational('3/2'))
      end

      it "less than 1, greater than -1" do
        expect(Fractional::Calculator.calculate!('/', Rational('3/4'), Rational('-1/2'))).to eq(Rational('-3/2'))
        expect(Fractional::Calculator.calculate!('/', Rational('3/4'), Rational('-3/2'))).to eq(Rational('-1/2'))
      end

      it "2 negative number" do
        expect(Fractional::Calculator.calculate!('/', Rational('-3/4'), Rational('-1/2'))).to eq(Rational('3/2'))
      end

      it "integers" do
        expect(Fractional::Calculator.calculate!('/', Rational('-3'), Rational('2'))).to eq(Rational('-3/2'))
      end
    end

    context "multiply" do
      it "less than 1" do
        expect(Fractional::Calculator.calculate!('*', Rational('3/4'), Rational('1/2'))).to eq(Rational('3/8'))
      end

      it "less than 1, greater than -1" do
        expect(Fractional::Calculator.calculate!('*', Rational('3/4'), Rational('-1/2'))).to eq(Rational('-3/8'))
        expect(Fractional::Calculator.calculate!('*', Rational('3/4'), Rational('-3/2'))).to eq(Rational('-9/8'))
      end

      it "2 negative number" do
        expect(Fractional::Calculator.calculate!('*', Rational('-3/4'), Rational('-1/2'))).to eq(Rational('3/8'))
      end

      it "integers" do
        expect(Fractional::Calculator.calculate!('*', Rational('-3'), Rational('2'))).to eq(Rational('-6'))
      end
    end
  end
end
