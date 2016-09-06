class SudokuBoard

  def initialize(string_board)
    string_board = string_board.chars
    @board = []
    while(string_board.size > 0)
      @board << string_board.slice!(0..8)
    end
  end

  def row(index)
    board[index]
  end 

  def column(index)
    board.map { |row| row[index] }.flatten
  end

  def sub_group(index)
    sub_group = []
    horizontal_third = find_horizontal_third(index)
    vertical_third   = find_vertical_third(index)

    board[horizontal_third].each { |row| sub_group << row[vertical_third] }
    sub_group.flatten
  end

  private

  def find_horizontal_third(index)
    range_start = (index / 3) * 3
    (range_start..(range_start + 2))
  end

  def find_vertical_third(index)
    case index
    when 0,3,6 
      return (0..2)
    when 1,4,7
      return (3..5)
    when 2,5,8
      return (6..8)
    end
  end
  
  attr_reader :board

end
