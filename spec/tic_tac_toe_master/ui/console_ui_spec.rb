# frozen_string_literal: true

RSpec.describe TicTacToeMaster::UI::ConsoleUI do
  let(:board) { instance_double(TicTacToeMaster::Board, grid: [1, 2, 3, 4, 5, 6, 7, 8, 9]) }
  let(:player1) { instance_double(TicTacToeMaster::Player, name: 'Alice', symbol: 'X') }
  let(:game) { instance_double(TicTacToeMaster::Game, board: board, current_player: player1) }

  subject(:ui) { described_class.new(game) }

  before do
    allow($stdout).to receive(:puts)
    allow($stdout).to receive(:print)
  end

  it 'asks for a move and calls make_move' do
    allow(ui).to receive(:ask_for_move).and_return(5)
    allow(game).to receive(:make_move).and_return(:draw)

    expect(game).to receive(:make_move).with(5)

    ui.start
  end

  describe '#draw_board' do
    it 'prints the board correctly' do
      expected_output = <<~OUT
        ╔═════╦═════╦═════╗
        ║  1  ║  2  ║  3  ║
        ╠═════╬═════╬═════╣
        ║  4  ║  5  ║  6  ║
        ╠═════╬═════╬═════╣
        ║  7  ║  8  ║  9  ║
        ╚═════╩═════╩═════╝
      OUT

      expect(ui.send(:draw_board, board)).to eq(expected_output)
    end
  end
end
