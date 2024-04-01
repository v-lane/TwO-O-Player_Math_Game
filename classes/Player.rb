class Player

  attr_accessor :id, :lives, :score

  def initialize(id)
    @id = id
    @lives = 3
    @score = 0
    
  end

  def lose_life
    @lives -= 1
  end

  def increase_score
    @score += 1
  end


end





