class ChessBoard
	def initialize
		@old_moves = []
		@board 		 = 8.times.map { Array.new(8, ".") }
		input(3,4)							# JUST TO CALL MARK
	end

	def input(x,y)						# handles old and new markings
		x = letters(x) if x.is_a?(String)
		if @old_moves.length > 0
			old = @old_moves.last 
			mark(old[0],old[1],true)
		end
		@old_moves << [x,y]
		mark(x,y)
	end

	def letters(letter)				# WHEN SOME INPUT IS A LETTER
		return ("a".."h").to_a.index(letter.downcase)
	end

	def mark(x, y, old=false)	# DRAWS ON THE BOARD
		old ? @board[y][x] = "o" :	@board[y][x] = "X" 
	end

	def show_board
		puts ("A".."H").to_a.join(" ")
		@board.each_with_index { |line, i| puts "#{line.join(" ")} #{i}" }
	end

	# def check_validity
	# 	return false if @x > 7
	# 	return false if @y > 7
	# 	return false if @board[@x][@y] == "o"
	# 	return true
	# end

	def knight_walk
		# BUILD TWO METHODS: 
		# 	ONE FOR CHECKING BOUNDARIES
		# 	THE OTHER FOR CHECKING FREE MOVES

		if check_validity
			puts "julio"
			@x += 2
			@y += 2
			mark
		end
	end
end

chess = ChessBoard.new
# chess.knight_walk
# chess.knight_walk
# puts chess.letters("E")
chess.input("E",5)
chess.input("F",6)
chess.show_board

