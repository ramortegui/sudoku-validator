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
    result = "This sudoku is ";
    is_valid = true
    is_complete = true

    @structure.each do |line|
      is_valid = false if !validate_line(line)
      is_complete = false if !validate_complete_line(line)
      break unless is_valid
    end
    
    if is_valid
      result += "valid"
    else
      result += "invalid"
    end
    if is_valid && !is_complete
      result += ", but incomplete"
    end
  
    result +="."
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
      return false if hash[char] != ''
      hash[char] = char
    end
    true
  end

  def validate_complete_line(line)
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
    hash.keys.each do |key|
      return false if hash[key] == ''
    end
    true
  end

  private
  def populate_arrays
    arr = ["","",""]
    arr_ver = ["","","","","","","","",""]

    @structure.each_index do |index|
      if (index > 0 && (index) % 3 == 0 )
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
    @structure += arr
    @structure += arr_ver
  end
  
end
