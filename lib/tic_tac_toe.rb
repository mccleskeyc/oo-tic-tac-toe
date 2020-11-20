class TicTacToe
    WIN_COMBINATIONS = [
    [0,1,2], # top 
    [3,4,5], # mid_horiz
    [6,7,8], # bottom
    [2,4,6], # diag_right
    [0,4,8], # diag_left
    [0,3,6], # left
    [1,4,7], # mid_vert
    [2,5,8] # right
    ]
    def initialize
        @board = [" "," "," "," "," "," "," "," "," "]
    end

    def display_board
        puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
        puts "-----------"
        puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
        puts "-----------"
        puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
      end

    def input_to_index(input)
        input.to_i - 1
    end

    def move (index, token)
        @board[index] = token
    end

    def position_taken?(index)
        @board[index] != " "
    end

    def valid_move?(position)
        position.between?(0,8) && !position_taken?(position)
    end

    def turn_count
        turn = 0
        @board.each do |round|
            if round == "X" || round == "O"
                turn += 1
            end
        end
        turn
    end

    def current_player
        if turn_count.even?
            player = "X"
        else
            player = "O"
        end
        player
    end

    def turn
        puts "Please select a number by entering a number 1-9:"
        position = gets.chomp
        index = input_to_index(position)
        if valid_move?(index)
          token = current_player
          move(index, token)
        else
          turn
        end
        display_board
      end

      def won?
        WIN_COMBINATIONS.any? do |combination|
          if position_taken?(combination[0]) && @board[combination[0]] == @board[combination[1]] && @board[combination[1]] == @board[combination[2]]
            return combination
          end
        end
      end

      def full?
        @board.all? {|space| space !=" "}    
      end

      def draw?
        if full? && !won?
            true
        else
            false
        end
      end

      def over?
        if won? || draw?
            true
        else
            false
        end
      end

      def winner
        result = won?
        if combination = won?
            @board[combination[0]]
        end
      end

      def play
        turn until over?
        puts winner ? "Congratulations #{winner}!" : "Cat's Game!"
      end
end