class Game
	@@field_coordinates = {
		1 => 1, 
		2 => 2,
		3=> 3,
		4=> 4, 
		5=> 5,
		6=> 6,
		7=> 7,
		8=> 8,
		9=> 9 
	}

	def initialize(player1 = nil, player2 = nil)
		@player1 = player1
		@player2 = player2
		@turn = 0
		@draw = false
	end

	def start				
		draw_field
		puts "#{@player1} enter your coordinates for X"		
	end

	def draw_field
		puts '-----------'
		puts " #{@@field_coordinates[1]} | #{@@field_coordinates[2]} | #{@@field_coordinates[3]} "
		puts '-----------'
		puts " #{@@field_coordinates[4]} | #{@@field_coordinates[5]} | #{@@field_coordinates[6]} "
		puts '-----------'
		puts " #{@@field_coordinates[7]} | #{@@field_coordinates[8]} | #{@@field_coordinates[9]} "
		puts '-----------'
	end
  

	def set_value(value)
		return warning_message unless valid?(value)

		if turn_even?
			@@field_coordinates[value] = 'X'			
		else
			@@field_coordinates[value] = 'O'
		end

		draw_field
		return end_game_message if finished?

		ask_player
		@turn+=1
	end

	def ask_player
		name = turn_even? ? @player1 : @player2
		symbol_value = turn_even? ? 'X' : 'O'
		puts "#{name}, please enter next coordinate for #{symbol_value}"
	end

	def finished?
		if win_condition?			
			true
		elsif @@field_coordinates.any? {|key, value| value.is_a? Integer}		
			false
		else
			@draw = true
			true
		end
	end

	def turn_even?
		@turn %2 == 0
	end

	def win_condition?
		(@@field_coordinates[1] == @@field_coordinates[2] && @@field_coordinates[2] == @@field_coordinates[3]) || 
		(@@field_coordinates[4] == @@field_coordinates[5] && @@field_coordinates[5] == @@field_coordinates[6]) || 
		(@@field_coordinates[7] == @@field_coordinates[8] && @@field_coordinates[8] == @@field_coordinates[9]) || 
		(@@field_coordinates[1] == @@field_coordinates[4] && @@field_coordinates[4] == @@field_coordinates[7]) || 
		(@@field_coordinates[2] == @@field_coordinates[5] && @@field_coordinates[5] == @@field_coordinates[8]) ||
		(@@field_coordinates[3] == @@field_coordinates[6] && @@field_coordinates[6] == @@field_coordinates[9]) ||
		(@@field_coordinates[1] == @@field_coordinates[5] && @@field_coordinates[5] == @@field_coordinates[9]) ||
		(@@field_coordinates[3] == @@field_coordinates[5] && @@field_coordinates[5] == @@field_coordinates[7])
	end

	def end_game_message
		if @draw
			puts 'Its a DRAW... play another game'
		else
			puts turn_even? ? "#{@player1} is victorious!!!" :  "#{@player2} is victorious!!!"
		end		
	end

	def warning_message
		puts 'Please enter only 1 symbol digit and only for empty slot'
	end

	def valid?(value_from_keybord)
		@@field_coordinates.any? do |key, value| 
			key == value_from_keybord			
			@@field_coordinates[value_from_keybord].is_a? Integer
		end		
	end
end


game = Game.new('Player1','Player2')
game.start

loop do
  break if game.finished?
  coordinate = gets.chomp.to_i  
  game.set_value(coordinate)
end
