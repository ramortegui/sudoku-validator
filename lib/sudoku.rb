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

  def validate_line(line)
    hash = {
      '1' => '',
      '2' => '',
      '3' => '',
      '4' => '',
      '5' => '',
      '6' => '',
      '7' => '',
      '8' => '',
      '9' => '',
    }
    line.split(//).each do |char|
      next if char == '0'
      return false if hash[char] == char || hash[char] == nil
      hash[char] = char
    end
    true
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
