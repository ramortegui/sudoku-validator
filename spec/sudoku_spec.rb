require_relative '../lib/sudoku.rb'
describe "Create and test sudoky" do
  context "create a sudoku" do
    it "returns a valid sudoku structure represented by an array of 9 strings of 9 characters" do
      file = File.read("spec/fixtures/valid_complete.sudoku")
      structure = Sudoku.new(file).structure
      result = structure.size
      expect(result).to eq 9 
      (0..8).each do |arr|
        expect(structure[arr].length).to eq 9 
      end 
    end
  end
  
  context "pupulate_arrays" do
    it "build structure of 27 arrays after pupulate_arrays" do

      file = File.read("spec/fixtures/valid_complete.sudoku")
      sudoku = Sudoku.new(file)
      sudoku.validate

      result = sudoku.structure.length
      expect(result).to eq 27
    end
  end
end
