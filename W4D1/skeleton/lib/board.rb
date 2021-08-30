class Board
  attr_accessor :cups

  def initialize(name1, name2)
    @name1, @name2 = name1, name2
    @cups = Array.new(14){Array.new()}
    self.place_stones
  end

  def place_stones
    # helper method to #initialize every non-store cup with four stones each
    @cups.each_with_index do |cup, i|
      cups[i] = [:stone, :stone, :stone, :stone] unless (i == 6 || i == 13)
    end
    @cups[6] = []
    @cups[13] = []
  end

  def valid_move?(start_pos)
    if start_pos == 6 || start_pos == 13 || start_pos < 0 || start_pos > 13
      raise 'Invalid starting cup'
    end
    if @cups[start_pos].empty?
      raise 'Starting cup is empty'
    end
    # if @current_player == @name1
    #   return true if (start_pos >= 0 && start_pos <= 5 && @cups[start_pos] > 0)
    # end
    # if @current_player == @name2
    #   return true if (start_pos >= 7 && start_pos <= 12 && cups[start_pos] > 0)
    # end
    # return false
  end

  def make_move(start_pos, current_player_name)
    stones = @cups[start_pos]
    @cups[start_pos] = []
    i = start_pos
    until stones.empty?
      stone = stones.pop
      i += 1
      i += 1 if current_player_name == @name1 && (i % @cups.length == 13)
      i += 1 if current_player_name == @name2 && (i % @cups.length == 6)
      @cups[i % cups.length] += [stone]
    end
    self.render
    return self.next_turn(i % cups.length)
      
  end

  def next_turn(ending_cup_idx)
    # helper method to determine whether #make_move returns :switch, :prompt, or ending_cup_idx
    return :prompt if ending_cup_idx == 6 || ending_cup_idx == 13
    return :switch if @cups[ending_cup_idx].length == 1
    return ending_cup_idx
  end

  def render
    print "      #{@cups[7..12].reverse.map { |cup| cup.count }}      \n"
    puts "#{@cups[13].count} -------------------------- #{@cups[6].count}"
    print "      #{@cups.take(6).map { |cup| cup.count }}      \n"
    puts ""
    puts ""
  end

  def one_side_empty?
    flag = true
    (0..5).each do |i|
      flag = false if !@cups[i].empty?
    end
    return true if flag
    flag = true
    (7..12).each do |i|
      flag = false if !@cups[i].empty?
    end
    return flag
  end

  def winner
    return :draw if @cups[6].length == @cups[13].length
    if @cups[6].length > @cups[13].length
      return @name1
    else
      return @name2
    end
  end
end
