require './Player.rb'

class Game 

  def initialize()
  @number_of_players = 0
  @players = []
  @current_player = 1
  @current_turn = 1
  end

  def status
    puts "---- STATUS ----"
    puts "Number of Players: #{@number_of_players}"
    puts "Players: #{@players}"
    puts "Current Turn: #{@current_turn}"
    puts "Current Player: #{@current_player}"
    puts "---- STATUS END ----"
  end

  def current_score
    puts "P1: #{@players[0].score}/#{@current_turn} vs P2: #{@players[1].score}/#{@current_turn}"
  end

  def add_player
    @number_of_players += 1
    @players << Player.new(@number_of_players)
  end

  def lose_life
    @players[@current_player-1].lose_life
    puts "Player #{@current_player} has lost a life. Player current lives: #{@players[@current_player-1].lives}."
  end
  
  def increase_score
    @players[@current_player - 1].increase_score
    puts "Player #{@current_player} has increased score. Player current score: #{@players[@current_player-1].score}."
    
  end

end

game_1 = Game.new()


game_1.add_player
game_1.add_player

game_1.status

game_1.lose_life
game_1.increase_score
game_1.current_score
