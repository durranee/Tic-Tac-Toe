# Requirements
# initialize :- (to be revised) initialize array
# print_board :- A method to print ttt table pretty
# set set_value (player_no, position)
# within_limit (input) :- to check if input is within limit (0-9)
# cell_empty? (index) :- checks if particular cell empty
# game_full? :- checking if there's board is full
# get_input (player_num) :- method to get input from user
# winner? :- A method to check if anyones won

# Main class to run the game
class TickTacToe
  # initializing board with empty spaces
  def initialize
    @board = []
    9.times { @board << ' ' }
    @players = { 1 => 'X', 2 => 'O' }
  end

# method to print the board on the screen
  def print_board
    system('clear') # Clears the shell window
    puts "[#{@board[0]}][#{@board[1]}][#{@board[2]}]"
    puts "[#{@board[3]}][#{@board[4]}][#{@board[5]}]"
    puts "[#{@board[6]}][#{@board[7]}][#{@board[8]}]"
  end

# method set_value to insert X or O in the location depending on player num
    def set_value (player_no, position)
      @board[position] = @players[player_no]
    end

# returns true if user entered between 1-9 for cell number
  def within_limit?(input)
    (input >= 0 && input < 9)
  end

end
