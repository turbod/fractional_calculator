# frozen_string_literal: true

require 'fractional/calculator'

# rubocop:disable Metrics/BlockLength
RSpec.describe Fractional::Calculator do
  context 'when valid input' do
    context 'when add' do
      it 'less than 1' do
        expect(described_class.calculate!('+', Rational('3/4'), Rational('1/2'))).to eq(Rational('5/4'))
      end

      it 'between 1 and -1' do
        expect(described_class.calculate!('+', Rational('3/4'), Rational('-1/2'))).to eq(Rational('1/4'))
      end

      it 'between 1 and -1, result negative' do
        expect(described_class.calculate!('+', Rational('3/4'), Rational('-3/2'))).to eq(Rational('-3/4'))
      end

      it '2 negative number' do
        expect(described_class.calculate!('+', Rational('-3/4'), Rational('-1/2'))).to eq(Rational('-5/4'))
      end

      it 'integers' do
        expect(described_class.calculate!('+', Rational('-3'), Rational('2'))).to eq(Rational('-1'))
      end
    end

    context 'when subtract' do
      it 'less than 1' do
        expect(described_class.calculate!('-', Rational('3/4'), Rational('1/2'))).to eq(Rational('1/4'))
      end

      it 'less than 1, greater than -1' do
        expect(described_class.calculate!('-', Rational('3/4'), Rational('-3/2'))).to eq(Rational('9/4'))
      end

      it '2 negative number' do
        expect(described_class.calculate!('-', Rational('-3/4'), Rational('-1/2'))).to eq(Rational('-1/4'))
      end

      it 'integers' do
        expect(described_class.calculate!('-', Rational('-3'), Rational('2'))).to eq(Rational('-5'))
      end
    end

    context 'when divide' do
      it 'zero division' do
        expect { described_class.calculate!('/', Rational('-3/4'), 0) }.to raise_error(ZeroDivisionError)
      end

      it 'less than 1' do
        expect(described_class.calculate!('/', Rational('3/4'), Rational('1/2'))).to eq(Rational('3/2'))
      end

      it 'less than 1, greater than -1' do
        expect(described_class.calculate!('/', Rational('3/4'), Rational('-1/2'))).to eq(Rational('-3/2'))
      end

      it '2 negative number' do
        expect(described_class.calculate!('/', Rational('-3/4'), Rational('-1/2'))).to eq(Rational('3/2'))
      end

      it 'integers' do
        expect(described_class.calculate!('/', Rational('-3'), Rational('2'))).to eq(Rational('-3/2'))
      end
    end

    context 'when multiply' do
      it 'less than 1' do
        expect(described_class.calculate!('*', Rational('3/4'), Rational('1/2'))).to eq(Rational('3/8'))
      end

      it 'less than 1, greater than -1' do
        expect(described_class.calculate!('*', Rational('3/4'), Rational('-3/2'))).to eq(Rational('-9/8'))
      end

      it '2 negative number' do
        expect(described_class.calculate!('*', Rational('-3/4'), Rational('-1/2'))).to eq(Rational('3/8'))
      end

      it 'integers' do
        expect(described_class.calculate!('*', Rational('-3'), Rational('2'))).to eq(Rational('-6'))
      end
    end
  end
end
# rubocop:enable Metrics/BlockLength
