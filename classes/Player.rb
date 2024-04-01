class Player
  @number_of_players = 0
  @players = []
  @current_player = 1
  @current_turn = 1

  class << self
    attr_accessor :number_of_players, :players, :current_player, :current_turn
  end

  def initialize()
    self.class.number_of_players += 1
    self.class.players << {
      number: self.class.number_of_players,
      lives: 3,
      score: 0
    }
  end

  def self.status
    puts "Number of Players: #{@number_of_players}"
    puts "Players: #{@players}"
    puts "Current Turn: #{@current_turn}"
    puts "Current Player: #{@current_player}"
  end

end

Player.status

player_1 = Player.new()
player_2 = Player.new()

Player.status


