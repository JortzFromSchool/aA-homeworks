class Board
  attr_accessor :cups

  def initialize(name1, name2)
    @name1, @name2 = name1, name2
    @current_player = name1
    self.place_stones
    @cups = Array.new(14, 0)
  end

  def place_stones
    # helper method to #initialize every non-store cup with four stones each
    @cups.each_with_index do |cup, i|
      cups[i] = 4 unless (i == 6 || i == 13)
    end
  end

  def valid_move?(start_pos)
    if @current_player == @name1
      return true if (start_pos >= 0 && start_pos <= 5 && @cups[start_pos] > 0)
    end
    if @current_player == @name2
      return true if (start_pos >= 7 && start_pos <= 12 && cups[start_pos] > 0)
    end
    return false
  end

  def make_move(start_pos, current_player_name)
  end

  def next_turn(ending_cup_idx)
    # helper method to determine whether #make_move returns :switch, :prompt, or ending_cup_idx
  end

  def render
    print "      #{@cups[7..12].reverse.map { |cup| cup.count }}      \n"
    puts "#{@cups[13].count} -------------------------- #{@cups[6].count}"
    print "      #{@cups.take(6).map { |cup| cup.count }}      \n"
    puts ""
    puts ""
  end

  def one_side_empty?
  end

  def winner
  end
end
