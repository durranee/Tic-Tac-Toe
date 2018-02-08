# Tic-Tac-Toe

[X][O][X]
[O][X][O]
[ ][X][ ]


Terminal based Tic-Tac-Toe game made using Ruby. Used 'colorized' gem for better readability.

# How to play.
User inputs names for players, at the start of the game.
Both names have to be unique. If user wants to play with computer instead of another user, the other player should be named as computer.

# How to select boxes to put X or O in.
User simply puts number of the box 1-9 to put their respective X or O in the box. If box is already occupied, game will generate an error message saying 'Error! Invalid choice.'

# two people can play the game or play with computer.
As mentioned, game can be played with another player or with computer (1 player game). If user wants to play with computer, they simply have to write computer as the name of other player.

# Clear screen before after every turn.
Game will clear the screen and display the board after every turn for better readability.

# Win or draw message
When a result is reached (either a win or a draw), game will puts the result (in green if a win or red if a draw). An example of Win message below.

[X][O][X]
[O][X][O]
[X][ ][ ]
****** GAME OVER ******
****** USER 1 WON ******
