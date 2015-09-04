class Sudoku
  attr_reader :structure

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
    populate_arrays
  end

  private
  def populate_arrays
    arr = ["","",""]
    arr_ver = ["","","","","","","","",""]

    @structure.each_index do |index|
      if (index+1) % 3 == 0  
        @structure += arr
        arr = ["","",""]
      end
      arr[0] += @structure[index].slice(0..2)
      arr[1] += @structure[index].slice(3..5)
      arr[2] += @structure[index].slice(6..8)
      (0..8).each do |column|
        arr_ver[column] += @structure[index].slice(column)
      end
    end
    @structure += arr_ver
  end
  
end
