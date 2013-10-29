class QueensEightProblem
  attr_accessor :board

  def initialize
    @board = (0..8).map { (0..8).map {[nil]} }
    8.times do |r|
      8.times do |c|
        self.board[r][c] = "-"
      end
    end
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
    board.each { |row| puts row.join "  "}
  end

  def update_position(position, mark)
    board[position[0]][position[1]] = mark
  end

  def update_positions(positions, mark)
    positions.each do |(row,col)|
      board[row][col] = mark
    end
  end

  def get_diagonals(position)
    diagonals = []

    8.times do |row|
      8.times do |col|
        row_diff = (position[0] - row).abs
        col_diff = (position[1] - col).abs
        diagonals << [row,col] if row_diff == col_diff
      end
    end

    diagonals
  end

  def is_attacked(position, main_position)
    return true if position[0] == main_position[0]
    return true if position[1] == main_position[1]

    return true if get_diagonals(main_position).include?(position)
    false
  end

  def safe_positions(available_positions, main_position)
    available_positions.select { |position| !is_attacked(position, main_position) }
  end

  def solve_recursive(remaining_positions, queen_count, indent)
    #str_indent = "   " * indent
    #puts str_indent + "REMAIN: #{remaining_positions.length}, Q: #{queen_count}"
    return [] if remaining_positions.empty? || queen_count > remaining_positions.length
    return [remaining_positions[0]] if remaining_positions.count == 1


    possible_positions = remaining_positions


    until remaining_positions.empty?
      next_position = remaining_positions.shift
      new_positions = safe_positions(remaining_positions, next_position)

      #puts str_indent + "POSITION: [#{next_position[0]}, #{next_position[1]}], #{new_positions.length}"

      result = solve_recursive(new_positions, queen_count - 1, indent + 1)
      #puts str_indent + "RESULT: #{result.length} with Q: #{queen_count}"
      if result.length == (queen_count-1)
        result << next_position
        return result
      end
    end

    return []
  end

  def solve
    queen_count = 8

    solve_recursive(create_positions, 8, 0)
  end
end

queen_problem = QueensEightProblem.new
queen_problem.print_board
#d = queen_problem.get_diagonals([1,2])
#d = queen_problem.safe_positions(queen_problem.create_positions, [1,2])
#queen_problem.update_positions(d, "Q")
#queen_problem.print_board
d = queen_problem.solve
queen_problem.update_positions(d, "Q")
queen_problem.print_board