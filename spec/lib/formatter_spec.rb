# frozen_string_literal: true

require 'fractional/formatter'

RSpec.describe Fractional::Formatter, "#format" do
  context "to quest" do
    it "lower than 1" do
      expect(Fractional::Formatter.to_quest('3/4')).to eq('3/4')
    end

    it "greater than 1" do
      expect(Fractional::Formatter.to_quest('7/4')).to eq('1&3/4')
    end

    it "negative number" do
      expect(Fractional::Formatter.to_quest('-3/4')).to eq('-3/4')
    end

    it "negative number with whole part" do
      expect(Fractional::Formatter.to_quest('-7/4')).to eq('-1&3/4')
    end
  end

end
