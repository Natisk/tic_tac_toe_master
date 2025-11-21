# frozen_string_literal: true

module TicTacToeMaster
  # Represents the game board for Tic Tac Toe
  class Board
    attr_reader :grid

    FIELD_SIZE = (1..9)

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
  end
end
