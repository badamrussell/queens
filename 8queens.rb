class QueensEightProblem
  def initialize
    @board = (0..8).map { (0..8).map {[nil]} }

  end

  def create_positions
    starting_positions = []
    8.times do |row|
      8.times do |col|
       starting_positions << [row,col]
      end
    end
    starting_positions
  end

  def print_board
    @board.each { |row| puts row.join " - "}
  end

  def update_position(position, mark)
    board[position[0]][position[1]] = mark
  end

  def is_attacked(position, main_position)
    return true if position[0] == main_position[0]
    return true if position[1] == main_position[1]

    #DETERMINE DIAGONAL THREAT...

  end

  def safe_positions(available_positions, main_position)
    available_positions.select { |position| !is_attacked(position, main_position) }
  end

  def solve_recursive(remaining_positions, queen_count, queen_position)
    return [remaining_positions[0]] if remaining_positions.count == 1
    return nil if remaining_positions.empty? && queen_count > 0

    new_positions = safe_positions(remaining_positions, queen_position)

    possible_positions = remaining_positions

    result = solve_recursive(new_positions, queen_count - 1, )
    if result.nil?
      puts "DEAD END SOLUTION"
    else

    end
  end

  def solve

    queen_count = 8
    starting_positions = create_positions

    #PLACE A QUEEN
    new_position = starting_positions.pop
    update_position(new_position, "Q")

    safe_positions(remaining_positions, new_position)

    # REMOVE ALL POSITIONS THAT SHE CAN ATTACK

  end
end

queen_problem = QueensEightProblem.new
queen_problem.print_board