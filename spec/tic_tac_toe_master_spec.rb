# frozen_string_literal: true

require 'spec_helper'

RSpec.describe TicTacToeMaster do
  it 'has a version number' do
    expect(TicTacToeMaster::VERSION).not_to be nil
  end

  it 'creates a new Game instance and calls start' do
    game_instance = instance_double(TicTacToeMaster::Game)
    expect(TicTacToeMaster::Game).to receive(:new).and_return(game_instance)
    expect(game_instance).to receive(:start)

    described_class.start
  end
end
