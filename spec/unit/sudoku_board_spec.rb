require_relative '../../lib/sudoku_board'
 
describe SudokuBoard do

  describe '#row(n)' do
    it 'returns the nth row as an array' do
      test_sudoku = described_class.new(TEST_BOARD)
      expect(test_sudoku.row(8)).to eq(%w[5 5 5 5 5 5 5 5 5])
    end
  end

  describe '#column(n)' do
    it 'returns the nth column as an array' do
      test_sudoku = described_class.new(TEST_BOARD)
      expect(test_sudoku.column(0)).to eq(%w[1 1 1 1 1 1 1 1 5])
    end
  end

  describe '#sub_group(n)' do

    it 'returns the nth sub_group as an array 0' do
      test_sudoku = described_class.new(TEST_BOARD)
      expect(test_sudoku.sub_group(0)).to eq(%w[1 2 3 1 2 3 1 2 3])
    end

    it 'returns the nth sub_group as an array 8' do
      test_sudoku = described_class.new(TEST_BOARD)
      expect(test_sudoku.sub_group(8)).to eq(%w[7 8 9 7 8 9 5 5 5])
    end

    it 'returns the nth sub_group as an array 7' do
      test_sudoku = described_class.new(TEST_BOARD)
      expect(test_sudoku.sub_group(7)).to eq(%w[4 5 6 4 5 6 5 5 5])
    end

  end

  TEST_BOARD = "123456789123456789123456789123456789123456789123456789123456789123456789555555555"

end
