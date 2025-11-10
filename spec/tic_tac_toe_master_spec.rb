# frozen_string_literal: true

require 'spec_helper'

RSpec.describe TicTacToeMaster do
  it 'has a version number' do
    expect(TicTacToeMaster::VERSION).not_to be nil
  end

  it 'creates a new Game instance and calls UI start' do
    game_instance = instance_double(TicTacToeMaster::Game)
    ui_instance = instance_double(TicTacToeMaster::UI::ConsoleUI)

    allow(TicTacToeMaster).to receive(:gets).and_return("Alice\n", "Bob\n")

    # waiting for game to be created
    expect(TicTacToeMaster::Game)
      .to receive(:new)
      .and_return(game_instance)

    # waiting for UI to be created with the game
    expect(TicTacToeMaster::UI::ConsoleUI)
      .to receive(:new)
      .with(game_instance)
      .and_return(ui_instance)

    # waiting for UI to call start
    expect(ui_instance).to receive(:start)

    described_class.start
  end
end
