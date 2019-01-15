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
		puts "#{result.name} wins!\n"
	end

	def prompt_rematch
		print "\nGame over! Do you want to play again (y/n)?: "
		gets.chomp.match?(/y/i)
	end

	def display_board_template
		puts "Board template to help you make your choice:\n\n"
		puts " 1 | 2 | 3 \n-----------\n 4 | 5 | 6 \n-----------\n 7 | 8 | 9 \n\n\n"
	end		
end
