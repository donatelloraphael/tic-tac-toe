class View
	def welcome_screen
		puts "\n\n		Tic-Tac-Toe Game\n		________________"
	end

	def get_player_name(num)
		print "\nEnter Player #{num}'s name: "
		gets.chomp
	end

	def alert_first(player)
		puts "\n#{player} goes first\n\n"
	end

	def display_result(result)
		if result == "draw"
			puts "The game was a draw"
		else
			puts "#{result.name} wins!\n"
		end
	end

	def prompt_rematch
		print "\nGame over! Do you want to play again (y/n)?: "
		gets.chomp.match?(/y/i)
	end

	def display_board_template
		puts "Board template to help you make your choice:\n\n"
		puts " 1 | 2 | 3 \n-----------\n 4 | 5 | 6 \n-----------\n 7 | 8 | 9 \n\n\n"
	end

	def display_board(board)
		puts " #{board[1]} | #{board[2]} | #{board[3]} \n-----------\n #{board[4]} | #{board[5]} | #{board[6]} \n-----------\n #{board[7]} | #{board[8]} | #{board[9]} \n\n\n"
	end

	def get_choice(turn, player, board)
		loop do
			print "Turn #{turn.to_s}, #{player.name} enter your choice: "
			choice = gets.chomp.to_i
			if board[choice] != nil
				puts "The cell is already occupied! Try again!"
			elsif choice < 1 || choice > 9
				puts "You entered an invalid choice! Try again!"				
			else
				board[choice] = player.symbol
				return board
			end
		end
	end

end
