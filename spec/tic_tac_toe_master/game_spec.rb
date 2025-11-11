# frozen_string_literal: true

RSpec.describe TicTacToeMaster::Game do
  let(:game) { described_class.new(player1_name: 'Alice', player2_name: 'Bob') }

  describe '#make_move' do
    it 'returns :invalid for an occupied position' do
      game.make_move(1)

      expect(game.make_move(1)).to eq(:invalid)
    end

    it 'returns :win for a winning move' do
      board = game.board
      board.place(1, 'X')
      board.place(2, 'X')

      expect(game.make_move(3)).to eq(:win)
    end

    it 'returns :draw when board is full' do
      allow(game.board).to receive(:place).and_return(true)
      allow(game.board).to receive(:winner?).and_return(false)
      allow(game.board).to receive(:full?).and_return(true)

      expect(game.make_move(1)).to eq(:draw)
    end

    it 'switches current_player after valid move' do
      expect(game.current_player).to eq(game.player1)

      game.make_move(1)
      expect(game.current_player).to eq(game.player2)

      game.make_move(2)
      expect(game.current_player).to eq(game.player1)
    end
  end
end
