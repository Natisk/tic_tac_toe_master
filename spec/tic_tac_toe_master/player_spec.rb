# frozen_string_literal: true

require 'spec_helper'

RSpec.describe TicTacToeMaster::Player do
  subject(:player) { described_class.new('John', 'X') }

  describe '#initialize' do
    it "assigns player's name" do
      expect(player.name).to eq('John')
    end

    it "assigns player' symbol" do
      expect(player.symbol).to eq('X')
    end
  end
end
