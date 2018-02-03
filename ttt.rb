
# Requirements
# initialize :- (to be revised) initialize array
# print_board :- A method to print ttt table pretty
# set set_value (player_no, position)
# within_limit (input) :- to check if input is within limit (0-9)
# cell_empty? (index) :- checks if particular cell empty
# has_spaces? :- checking if there's board is full
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
    @board.each_index { |index|
      print "[#{@board[index]}]"
      print "\n" if ((index+1) % 3).zero?
    }
  end

# method set_value to insert X or O in the location depending on player num
    def set_value (player_no, position)
      @board[position] = @players[player_no]
    end

# returns true if user entered between 1-9 for cell number
  def within_limit?(input)
    (input >= 0 && input < 9)
  end

# method to check if location chosen is empty
  def cell_empty? (index)
    @board[index] == ' '
  end

# method to check if board is full, returns false if no empty spaces
  def has_spaces?
    @board.join.include?(' ')
  end

# method to get input from user (checks if board is full and if
# location selected is valid i-e if cell is empty. Also sets the value)
# puts an error if invalid choice
  def get_input (player_num)
    input = ' '
    while has_spaces?
      puts "Player#{player_num} ( #{@players[player_num]} )"
      print "please choose an empty position: "
      input = gets.chomp.to_i
      input -= 1

      if (within_limit?(input) && cell_empty?(input))
        # setting input from here instead of returning input
        # will fix later to make more sense
        set_value(player_num, input)
        return # input
      else
        input = ' '
        puts 'Error! Invalid choice.'
      end
    end
  end

# This method winner? checks if we have a winner
# to be executed after every turn
  def winner?(current_player)
  # winning combinations (indexes)
  # 0,1,2 # 3,4,5 # 6,7,8 # 0,3,6
  # 1,4,7 # 2,5,8 # 0,4,8 # 2,4,6
  winning_combinations = [
                          [0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6],
                          [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]
                        ]
  winning_combinations.each { |comb_set|
    combination = comb_set.map { |indexes| @board[indexes] }

    if combination.join == 'XXX' || combination.join == 'OOO'
        #returns true if win else reset combination
        puts "******* PLAYER #{current_player} WON!!*******"
        return true
      end
      combination = ['']
  }
  # There's a lot of improvement needed. Method should just return true or false
  # For now just puts "WE HAVE  WINNER"
  return false
end

end

new_game = TickTacToe.new
current_player = 1
new_game.print_board

while new_game.has_spaces? && !new_game.winner?(current_player)
  new_game.get_input(current_player)
  new_game.print_board
  new_game.winner?(current_player)

  current_player += 1
  current_player = 1 if (current_player > 2)
end
