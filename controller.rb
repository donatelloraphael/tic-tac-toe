require './view.rb'
require './player.rb'
require './board.rb'

class Controller
	#attr_accessor :player1, :player2

	def initialize
		@view = View.new
		@view.welcome_screen
		start_game
		#loop_game
	end

	def start_game
		player_a = Player.new
		player_b = Player.new
		board = Board.new

		player_a.name = @view.get_player_name(1)
		player_b.name = @view.get_player_name(2)
		
		players = [player_a, player_b]
		players.sort_by!{rand}
		player1 = players[0]
		player2 = players[1]
		puts player1.name
		puts player2.name
		@view.alert_first(player1.name)
		
		result = board.play(player1, player2)
		@view.display_result(result)

		if @view.prompt_rematch
			Controller.new
		else
			exit
		end
	end
end

Controller.new