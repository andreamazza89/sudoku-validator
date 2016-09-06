class Validator
  def initialize(puzzle_string)
    @puzzle_string = puzzle_string
    @sudoku_board = SudokuBoard.new(select_digits(puzzle_string))
  end

  def self.validate(puzzle_string)
    new(puzzle_string).validate
  end

  def validate
    valid    = true
    complete = true

    rows       = (0..8).map { |i| sudoku_board.row(i) }
    columns    = (0..8).map { |i| sudoku_board.column(i) }
    sub_groups = (0..8).map { |i| sudoku_board.sub_group(i) }

    [rows, columns, sub_groups].each do |group|
      complete = false unless is_complete?(group)
      valid    = false unless is_valid?(group)
    end

    "This sudoku is " + 
    (valid ? ("valid" + (complete ? "" : ", but incomplete")) : "invalid") + 
    "."
  end

  private
  
  def select_digits(string)
    string.gsub(/[^\d]/, '')
  end

  def is_valid?(group)
    group.each do |collection|
      collection.delete("0")
      return false unless collection.uniq == collection
    end
    return true
  end

  def is_complete?(group)
    group.each do |collection|
      return false unless collection.none? { |item| item == "0" }
    end
    return true
  end
  
  attr_reader :puzzle_string, :sudoku_board
  
end
