#!/usr/bin/env ruby

# Requirements
# initialize :- (to be revised) initialize array
# print_board :- A method to print ttt table pretty
# set set_value (player_no, position)
# within_limit (input) :- to check if input is within limit (0-9)
# cell_empty? (index) :- checks if particular cell empty
# has_spaces? :- checking if there's board is full
# get_user_input (player_num) :- method to get input from user
# winner? :- A method to check if anyones won
# print_result(current_player) :- Prints message if game is won

# start_game () :- entry point to the game (out of class)
# get_players_name(num) :- collects a name, returns string (out of class)
# uniq_name? (p1, p2) :- checks if both names are uniq (return bool)

require 'colorize'
# Main class to run the game
class TickTacToe
  # initializing board with empty spaces
  def initialize (p1, p2)
    @winner = :no_one
    @board = []
    @players_and_keys = { p1 => 'X', p2 => 'O' }
    9.times { @board << ' ' }
  end

# method to print the board on the screen
  def print_board
    system('clear') # Clears the shell window
    puts '********** Welcome to Tic Tac Toe **********'.blue
    @board.each_index { |index|
      @board[index].eql?('X') ? (print "[#{@board[index].red}]") :
      (print "[#{@board[index].green}]")
      print "\n" if ((index+1) % 3).zero?
    }
  end

# method to check if board is full, returns false if no empty spaces
  def has_spaces?
    @board.join.include?(' ')
  end

  def is_it_a_draw (current_player)
    @winner == (:no_one && !has_spaces?)
  end

  def print_draw
    puts "****** GAME OVER ******".red
    puts "****** IT'S A DRAW ******".red
  end

  def print_win
    puts "****** GAME OVER ******".green
    puts "****** #{@winner.upcase} WON ******".green
  end

# Printing result message
def print_result
  @winner.eql?(:no_one) ? print_draw : print_win
end

# method set_value to insert X or O in the location depending on player num
    def set_value (value, position)
      @board[position] = value
    end

# returns true if user entered between 1-9 for cell number
  def within_limit?(input)
    (input >= 0 && input < 9)
  end

# method to check if location chosen is empty
  def cell_empty? (index)
    @board[index] == ' '
  end


def get_computer_input
  position = rand(9)
  unless cell_empty?(position)
    position = rand(9)
  end
  return position
end

# method to get input from user (checks if board is full and if
# location selected is valid i-e if cell is empty. Also sets the value)
# puts an error if invalid choice
  def get_user_input (player)
    input = ' '
    while has_spaces?
      # if player is computer = just randomly choose a number
      # TO BE IMPLEMENTED

      print "#{player}, please choose an empty position: "

      if player.eql?('Computer')
        position = get_computer_input
        set_value(@players_and_keys[player], position)
        return
      else
      position = (gets.chomp.to_i - 1)

      if (within_limit?(position) && cell_empty?(position))
        # setting input from here instead of returning input
        # will fix later to make more sense
        set_value(@players_and_keys[player], position)
        return # input
      else
        input = ' '
        puts 'Error! Invalid choice.'.red
      end
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
      # returns true if win else reset combination
      # save winner name in @winner
      @winner = current_player
      return true
    end
      combination = ['']
  }
  return false # will execute if no winning combination found
  end


end

def uniq_name? (p1, p2)
  if p1.downcase == p2.downcase
  puts "Error! Both names can't be silimar"
  return false
  end
  return true
end

def get_players_name(num)
  print "Please enter the name for player #{num} \n"
  print "to play with computer, \'type computer\': "
  gets.chomp.capitalize
end

def start_game
  system('clear')
  puts '********** Welcome to Tic Tac Toe **********'.blue

  player1 = get_players_name(1)
  player2 = get_players_name(2)


  until uniq_name?(player1, player2)
    player1 = get_players_name(1)
    player2 = get_players_name(2)
  end

  new_game = TickTacToe.new(player1, player2)

  current_player = player1
  new_game.print_board

  while new_game.has_spaces? && !new_game.winner?(current_player)
    new_game.get_user_input(current_player)
    new_game.print_board
    break if new_game.winner?(current_player)
    #####################################################
    # need to print winning message before the code below
    current_player = current_player.eql?(player1) ? player2 : player1
  end
  new_game.print_result
  #new_game.is_it_a_draw(current_player)

end

start_game
