# frozen_string_literal: true

require_relative 'tic_tac_toe_master/version'
require_relative 'tic_tac_toe_master/game'
require_relative 'tic_tac_toe_master/board'
require_relative 'tic_tac_toe_master/player'

module TicTacToeMaster
  def self.start
    Game.new.start
  end
end
