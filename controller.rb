require './view.rb'
require './player.rb'
require './board.rb'

class Controller
	#attr_accessor :player1, :player2
	@winning_positions = %w[123 456 789 147 258 369 159 357]

	def initialize
		@view = View.new
		@view.welcome_screen
		start_game
		#loop_game
	end

	def start_game
		player_a = Player.new
		player_b = Player.new
		# board = Board.new

		player_a.name = @view.get_player_name(1)
		player_b.name = @view.get_player_name(2)
		
		players = [player_a, player_b]
		players.sort_by!{rand}
		player1 = players[0]
		player2 = players[1]
		puts player1.name
		puts player2.name
		@view.alert_first(player1.name)
		
		result = self.play(player1, player2)
		@view.display_result(result)

		if @view.prompt_rematch
			start_game
		else
			exit
		end
	end

	def play(player1, player2)
		@view.display_board_template
		@board = []
		player1.symbol = 'x'
		player2.symbol = 'o'

		turn = 1
		while turn <= 9  do
			@view.display_board(@board)
			if turn % 2 == 1
				@board = @view.get_choice(turn, player1, @board)
			else
				@board = @view.get_choice(turn, player2, @board)
			end

			result = self.check_win(@board.join(""), turn, player1, player2) if turn >= 5
			return result if result != false
			turn += 1
		end

		return "draw"
	end

	def check_win(board, turn, player1, player2)
		if turn % 2 == 1
			winning_positions.each do |value|
				matches = 0
				value.split("").each do |value|
					if board[value.to_i] == player1.symbol
						matches += 1
					end
				end
				return player1 if matches == 3
			end
		else
			winning_positions.each do |value|
				matches = 0
				value.split("").each do |value|
					if board[value.to_i] == player2.symbol
						matches += 1
					end
				end
				return player2 if matches == 3
			end
		end
		return false
	end
end

Controller.new