# frozen_string_literal: true

module TicTacToeMaster
  # Represents the game board for Tic Tac Toe
  class Board
    attr_reader :grid

    FIELD_SIZE = (1..9)

    WIN_CONBINATIONS = [
      [0, 1, 2], [3, 4, 5], [6, 7, 8],
      [0, 3, 6], [1, 4, 7], [2, 5, 8],
      [0, 4, 8], [2, 4, 6]
    ].freeze

    def initialize
      @grid = FIELD_SIZE.to_a
    end

    def place(position, symbol)
      return false unless valid_position?(position)

      grid[position - 1] = symbol
      true
    end

    def valid_position?(position)
      FIELD_SIZE.cover?(position) && grid[position - 1].is_a?(Integer)
    end

    def full?
      grid.none?(Integer)
    end

    def winner?(symbol)
      WIN_CONBINATIONS.any? do |combo|
        combo.all? { |index| grid[index] == symbol }
      end
    end
  end
end
