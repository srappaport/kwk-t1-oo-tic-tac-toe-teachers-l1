class TicTacToe
  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end

  WIN_COMBINATIONS = [
    [0,1,2], # Top row
    [3,4,5],  # Middle row
    [6,7,8],
    [0,3,6],
    [1,4,7],
    [2,5,8],
    [0,4,8],
    [2,4,6]
  ]
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
## input_to_index
def input_to_index(number)
  number = number.to_i
  index = number - 1
  return index
end
## move
def move(index, counter = "X")
  @board[index]=counter
end
# position_taken
def position_taken?(index)
  !(@board[index].nil? || @board[index] == " ")
end
#valid move FIX ME
def valid_move?(index)
  if position_taken?(@board,index) == false && index.between?(0,8)
    true
  else
    false
  end
end

# turn
def turn(value)
  puts "Please enter 1-9:"
  input = gets.strip
  index=input_to_index(input)
  if valid_move?(@board, index) == true
    move(@board, index, value)
    display_board(@board)
  else
    turn(@board,value)
  end
end
# turn count
def turn_count(board)
  count =0
  board.each do |move|
    if move == "X" || move == "O"
      count += 1
    end
  end
return count
end
# current player
def current_player(board)
  count=turn_count(board)
  if count % 2 == 0
    return "X"
  else
    return "O"
  end
end
# won
def won?(board)
  WIN_COMBINATIONS.each do |win_combination|
    win_index_1 = win_combination[0]
    win_index_2 = win_combination[1]
    win_index_3 = win_combination[2]
    p_1 = board[win_index_1]
    p_2 = board[win_index_2]
    p_3 = board[win_index_3]
    if p_1 == "X" && p_2 == "X" && p_3 == "X"
      return win_combination
      winner = "X"
    elsif p_1 == "O" && p_2 == "O" && p_3 == "O"
      return win_combination
      winner = "O"
    else
      win_combination=0
    end
  end
  if win_combination=0
    return false
  end
end
# full
def full?(board)
  if board.include? " "
    return false
  else
    return true
  end
end
# draw
def draw?(board)
  if won?(board)
    return false
  else full?(board)
    return true
  end
end
#over
def over?(board)
  if won?(board)
    return true
  elsif full?(board)
    return true
  else
    return false
  end
end
#winner
def winner(board)
  if won?(board)
    win_combination = won?(board)
    windex = win_combination[0]
    if board[windex] == "X"
      return "X"
    else
      return "O"
    end
  end
end


def play(board)
  puts "Welcome to Tic Tac Toe!"
  until over?(board)
    turn_count = turn_count(board)
    value = current_player(board)
    turn(board,value)
  end
  if won?(board)
    win=winner(board)
    puts "Congratulations #{win}!"
  else
    puts "Cat's Game!"
  end
end
end
