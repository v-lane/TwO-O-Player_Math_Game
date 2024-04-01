# require './Problem.rb'
# require './Player.rb'


class Game 

  def initialize()
  @number_of_players = 0
  @players = []
  @problems = []
  @current_player = 1
  @current_turn = 1
  @winner
  add_players
  @problems_data = [
    {
      id: 1,
      question: "What is 10 + 5?",
      answer: 15
    },
    {
      id: 2,
      question: "What is 20 - 4?",
      answer: 16
    },
    {
      id: 3,
      question: "What is 7 x 3?",
      answer: 21
    },
    {
      id: 4,
      question: "What is 48 ÷ 6?",
      answer: 8
    },
    {
      id: 5,
      question: "What is the product of 9 and 8?",
      answer: 72
    },
    {
      id: 6,
      question: "What is one half of 100?",
      answer: 50
    },
    {
      id: 7,
      question: "What is 15% of 200?",
      answer: 30
    },
    {
      id: 8,
      question: "What is 60 divided by 5?",
      answer: 12
    },
    {
      id: 9,
      question: "What is the sum of 13 and 29?",
      answer: 42
    },
    {
      id: 10,
      question: "What is 100 minus 57?",
      answer: 43
    },
    {
      id: 11,
      question: "How many sides does a hexagon have?",
      answer: 6
    },
    {
      id: 12,
      question: "What is 8 squared?",
      answer: 64
    },
    {
      id: 13,
      question: "What is the cube of 3?",
      answer: 27
    },
    {
      id: 14,
      question: "If you have 4 apples and you give away 2, how many do you have left?",
      answer: 2
    },
    {
      id: 15,
      question: "What is the remainder when you divide 23 by 5?",
      answer: 3
    },
    {
      id: 16,
      question: "What is 1/4 written as a decimal?",
      answer: 0.25
    },
    {
      id: 17,
      question: "If a triangle has two angles of 45 degrees, what is the measure of the third angle?",
      answer: 90
    },
    {
      id: 18,
      question: "What is 14 times 1?",
      answer: 14
    },
    {
      id: 19,
      question: "If you buy 3 chocolates for $1 each and give the shopkeeper $5, how much change should you receive?",
      answer: 2
    },
    {
      id: 20,
      question: "What is the perimeter of a square with a side length of 5 units?",
      answer: 20
    }
  ]
  add_problems
  end
  
  def start
    set_up_game
    turn
  end

  private  
  
  def set_up_game
    puts "\n-----------------------\n----- LET'S PLAY! ----- \n-----------------------\n"
  end

  def add_problems
    (@problems_data.length).times { |i| add_problem }
  end

  def add_problem
    id = @problems.length
    @problems << Problem.new(id + 1, @problems_data[id - 1][:question], @problems_data[id-1][:answer])
  end

  def add_players
  2.times { |i| add_player }
  end

  def add_player
    @number_of_players += 1
    @players << Player.new(@number_of_players)
  end

  def turn
    puts "\n    ----------------"
    puts "    ---- TURN #{@current_turn} ---- \n"
    puts "    ----------------"
    question_num_1 = random_number
    question_num_2 = random_number
    if question_num_1 == question_num_2 
      if question_num_2 > 2
        question_num_2 = question_num_1 - 1
      else 
        question_num_2 = question_num_1 + 1
      end
    end

    question_1 = @problems[question_num_1].question
    question_2 = @problems[question_num_2].question

    answer_1 = @problems[question_num_1].answer.to_i
    answer_2 = @problems[question_num_2].answer.to_i

    puts "\n--- PLAYER: #{@current_player} ---"
    ask_question(question_1, answer_1)
    puts "\n--- PLAYER: #{@current_player} ---"
    ask_question(question_2, answer_2)

    turn_resolve
  end

  def random_number
    rand(20)
  end
  
  def turn_resolve
    current_score
    check_lives
  end
    
  def current_score
    puts "\n--- CURRENT ---"
    puts "Score: \n  Player 1: #{@players[0].score}/#{@current_turn} \n  Player 2: #{@players[1].score}/#{@current_turn}"
  end

  def ask_question(question, answer)
    puts "Player #{@current_player}: #{question}"
    print "> " 
    player_answer = STDIN.gets.chomp.to_i
    if player_answer == answer
      puts "✅ Correct!"
    increase_score
    else
      puts "❌ Incorrect!"
      lose_life
    end  
    toggle_current_player
  end

  def lose_life
    @players[@current_player-1].lose_life
  end
  
  def increase_score
    @players[@current_player - 1].increase_score
  end

  def toggle_current_player
    @current_player = (@current_player == 1 ? 2: 1)
  end

  def check_lives
    player_1_lives = @players[0].lives
    player_2_lives = @players[1].lives
    if player_1_lives > 0 && player_2_lives > 0
      puts "\nLives Remaining: \n  Player 1: #{player_1_lives} \n  Player 2: #{player_2_lives}" 
      @current_turn += 1
      turn
    else 
      end_game
    end
  end

  def end_game
    puts "\n---------------------\n----- GAME OVER -----\n---------------------"
    player_1_score = @players[0].score
    player_2_score = @players[1].score
    @winner = (player_1_score > player_2_score ? @players[0] : @players[1])

    
    puts "\nPlayer #{@winner.id} wins with a score of #{@winner.score}/#{@current_turn}"
    puts "\nGoodbye!\n\n"
  end

end
