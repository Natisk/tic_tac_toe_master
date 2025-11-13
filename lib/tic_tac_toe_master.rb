# frozen_string_literal: true

require_relative 'tic_tac_toe_master/version'
require_relative 'tic_tac_toe_master/game'
require_relative 'tic_tac_toe_master/board'
require_relative 'tic_tac_toe_master/player'
require_relative 'tic_tac_toe_master/ui/console_ui'

# Main namespace for TicTacToeMaster gem.
# Provides an entry point to start the Tic Tac Toe game
# using different UI implementations (e.g., ConsoleUI, WebUI).
module TicTacToeMaster
  class << self
    # Starts the Tic Tac Toe game.
    #
    # Options:
    # ui_class - the UI class to use (default: UI::ConsoleUI)
    # player1_name, player2_name - optional names for players
    #
    # Examples:
    #   TicTacToeMaster.start
    #   TicTacToeMaster.start(ui_class: UI::ConsoleUI, player1_name: 'Alice', player2_name: 'Bob')
    def start(ui_class: TicTacToeMaster::UI::ConsoleUI, player1_name: nil, player2_name: nil)
      player1_name, player2_name = resolve_player_names(ui_class, player1_name, player2_name)

      game = Game.new(player1_name: player1_name, player2_name: player2_name)
      ui_class.new(game).start
    end

    private

    # Determines or asks for player names depending on the UI type.
    # For ConsoleUI, it prompts for names if not provided.
    # For other UIs, both names must be passed explicitly.
    #
    # Returns an array: [player1_name, player2_name]
    def resolve_player_names(ui_class, player1_name, player2_name)
      if ui_class == TicTacToeMaster::UI::ConsoleUI
        player1_name ||= ask_for_name('Player 1 (X)')
        player2_name ||= ask_for_name('Player 2 (O)')
      else
        unless player1_name && player2_name
          raise ArgumentError, 'player1_name and player2_name are required for non-console UI'
        end
      end

      [player1_name, player2_name]
    end

    # Prompts the user to enter a name for the given player.
    #
    # Returns the entered string (stripped of whitespace).
    def ask_for_name(label)
      print "Enter name for #{label}: "
      gets.strip
    end
  end
end
