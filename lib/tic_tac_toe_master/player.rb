# frozen_string_literal: true

module TicTacToeMaster
  # Represents a Player with name and symbol(X or O)
  class Player
    attr_reader :name, :symbol

    def initialize(name, symbol)
      @name = name
      @symbol = symbol
    end
  end
end
