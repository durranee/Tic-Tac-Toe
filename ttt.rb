# Requirements
# initialize :- (to be revised) initialize array
# print_me_pretty :- A method to print ttt table pretty
# set set_value (player_no, position)
# within_limit (input) :- to check if input is within limit (0-9)
# cell_empty? (index) :- checks if particular cell empty
# game_full? :- checking if there's board is full
# get_input (player_num) :- method to get input from user
# winner? :- A method to check if anyones won

class TickTacToe
  # initializing board with empty spaces
  def initialize
    @board = []
    9.times { @board << ' ' }
    @players = { 1 => 'X', 2 => 'O' }
  end
    
end
