# frozen_string_literal: true

require 'spec_helper'

RSpec.describe TicTacToeMaster::Board do
  subject(:board) { described_class.new }

  describe '#initialize' do
    it 'creates boasd with numbers from 1 to 9' do
      expect(board.grid).to eq(described_class::FIELD_SIZE.to_a)
    end
  end

  describe '#valid_position?' do
    it 'returns true for a free cell' do
      expect(board.valid_position?(1)).to be true
    end

    it 'returns false for a cell outside the field' do
      expect(board.valid_position?(10)).to be false
      expect(board.valid_position?(0)).to be false
    end

    it 'returns false for an already occupied cell' do
      board.place(1, 'X')
      expect(board.valid_position?(1)).to be false
    end
  end

  describe '#place' do
    it 'places the symbol in the correct position' do
      expect(board.place(1, 'X')).to be true
      expect(board.grid[0]).to eq('X')
    end

    it 'does not place the symbol if the position is invalid' do
      board.place(1, 'X')
      expect(board.place(1, 'O')).to be false
      expect(board.grid[0]).to eq('X')
    end
  end

  describe '#full?' do
    it 'returns false if there are still free cells' do
      expect(board.full?).to be false
    end

    it 'returns true if all cells are occupied' do
      (1..9).each { |pos| board.place(pos, 'X') }
      expect(board.full?).to be true
    end
  end
end
