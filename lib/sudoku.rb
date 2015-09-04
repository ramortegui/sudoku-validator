class Sudoku

  def initialize(file)
    @structure = []
    i = 0
    file.each_line do |line|
      numbers = line.gsub(/\s|\|/,'')
      @structure[i] = numbers unless numbers.include? "+"
      i+= 1 unless numbers.include? "+"
    end
  end
  def validate
  end
  attr_reader :structure
end
