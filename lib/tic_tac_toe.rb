class TicTacToe
  def initialize(board = nil)
  @board = board || Array.new(9, " ")
  @WIN_COMBINATIONS = [
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8],
    [0, 3, 6],
    [1, 4, 7],
    [2, 5, 8],
    [0, 4, 8],
    [6, 4, 2]
  ].freeze
end

def current_player
  turn_count % 2 == 0 ? "X" : "O"
end

def turn_count
  @board.count{|token| token == "X" || token == "O"}
end

def display_board
  puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
  puts "-----------"
  puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
  puts "-----------"
  puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
end

def valid_move?(index)
  index.between?(0, 8) && !position_taken?(@board, index)
end

def won?
  WIN_COMBINATIONS.detect do |combo|
    @board[combo[0]] == @board[combo[1]] &&
      @board[combo[1]] == @board[combo[2]] &&
      position_taken?(@board, combo[0])
  end
end

def full?
  @board.all? { |token| token == 'X' || token == 'O' }
end

def draw?
  !won?(@board) && full?(@board)
end

def over?
  won?(@board) || draw?(@board)
end

def input_to_index(user_input)
  user_input.to_i - 1
end

def turn
  puts 'Please enter 1-9:'
  user_input = gets.strip
  index = input_to_index(user_input)
  if valid_move?( index)
    move(board, index, current_player(board))
    display_board
  else
    turn
  end
end

def position_taken?(index)
  @board[index] == 'X' || @board[index] == 'O'
end

def move (index, player)
  @board[index] = player
end

def winner
  if winning_combo = won?(board)
    @board[winning_combo.first]
  end
end

  def play
    
  end
end
