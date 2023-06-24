# frozen_string_literal: true

require 'fractional/formatter'

RSpec.describe Fractional::Formatter do
  describe 'to quest' do
    it 'lower than 1' do
      expect(described_class.to_quest('3/4')).to eq('3/4')
    end

    it 'greater than 1' do
      expect(described_class.to_quest('7/4')).to eq('1&3/4')
    end

    it 'greater than 1, need simpler format' do
      expect(described_class.to_quest('4/2')).to eq('2')
    end

    it 'negative number' do
      expect(described_class.to_quest('-3/4')).to eq('-3/4')
    end

    it 'negative number with whole part' do
      expect(described_class.to_quest('-7/4')).to eq('-1&3/4')
    end
  end
end
