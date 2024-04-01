=begin
#############
# Description
#############
Create a 2-Player math game where players take turns to answer 
simple math addition problems. A new math question is generated 
for each turn by picking two numbers between 1 and 20. The player whose 
turn it is is prompted the question and must answer correctly or lose a life.

#########
# Details
#########
Both players start with 3 lives. They lose a life if they mis-answer a question. 
At the end of every turn, the game should output the new scores for both players, 
so players know where they stand.

The game doesn’t end until one of the players loses all their lives. 
At this point, the game should announce who won and what the other 
player’s score is.

##########
# Planning
##########

NOUNS
#####

Players
  - Lives
  - Scores

Turns?

Problems
  - Questions
  - Answers


ROLES
#####
class Game
  - variables
    - player tracker (stores hashes of each player) -> Array of Hashes [{}]
      - lives tracker (game ends when a player has lives = 0) -> Integer
      - player # -> Integer
      - player name? -> String
    - score tracker -> Integer
    - current_player (after each question, player who answers swaps) -> Integer
    - current_turn -> Integer

  - methods (public)
    - start game (
      - set_up
      - turn
      - end_game
    )

  - methods (prviate)
    - set-up (
      - ----- GAME START -----
      - ask each player their name and create 2 player classes
      )
    - turn_initialize (
      - ------ NEW TURN ------
      - local vars -> randomly generate 2 questions (numbers between 1 and 20)
    )
    - turn_main (
      - / x1 ask question(1)
      - / x2 ask question(2)
      )
    - turn_resolve(
      - if lives != 0
        - increase turn count by 1
        - start new turn
      - end game 
    )
    - turn (
      - turn_initialize
      - turn_main
      - turn_resolve
      )
    - end game(
      - if player 1 score > player 2 score, return for player 1, else for player 2
        - puts player score (correct answers / total question(current turn count)
      - ----- GAME OVER -----
      - puts Good bye! 
      - ends program
    )
    - ask question (
      - ask current player question
      - get player input
      - check if answer correct
      - puts response - correct/incorrect
      - change current player
    )

class Player
  - variables 
    - individual lives (start at 3, decrease by 1 on incorrect answer) -> Integer
    - individual score (start at 0, increase by 1 on correct answer) -> Integer

  
  

class Problem
  - variables
    - individual question -> String
    - individual answer -> Integer/Float













=end