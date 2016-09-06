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
    horizontal_third = (index / 3) * 3
    vertical_third   = find_vertical_third(index)

    board[horizontal_third..horizontal_third + 2].each { |row| sub_group << row[vertical_third..vertical_third + 2] }
    sub_group.flatten
  end

  private

  def find_vertical_third(index)
    case index
    when 0,3,6 
      return 0
    when 1,4,7
      return 3
    when 2,5,8
      return 6
    end
  end
  
  attr_reader :board

end
