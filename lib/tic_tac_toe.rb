class TicTacToe

  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end

  WIN_COMBINATIONS = [
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8],
    [0, 3, 6],
    [1, 4, 7],
    [2, 5, 8],
    [0, 4, 8],
    [2, 4, 6],
  ]

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def input_to_index(user_input)
    user_input.to_i - 1
  end
  def move(index, token = "X")
    @board[index] = token
  end

  def position_taken?(index)
    !(@board[index] == " " || @board[index] == nil)
  end

  def valid_move?(index)
    index.between?(0, 8) && @board[index] == " "
  end

  def turn_count
    counter = 0
    @board.each do |token|
      if token == "X" || token == "O"
        counter += 1
      end
    end
    counter
  end

  def current_player
    if turn_count % 2 == 0
      return "X"
    else
      return "O"
    end
  end

  def turn
    puts "Please enter a move: 1-9: "
    user_input = gets.strip
    input_to_index(user_input)
      if valid_move?(input_to_index(user_input))
        token = current_player
        move(input_to_index(user_input), token)
        display_board
      else
        turn
      end
    end


end
