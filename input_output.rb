# Processes input to be passed to other classes
module InputOutput
  def user_input
    input = gets.chomp.split('')
    clean_input(input)
  end

  def clean_input(input)
    alphabet_array = ('a'..'h').to_a
    first = input[0]
    second = input[1]
    if valid_alphabet?(first) && valid_integer?(second)
      first = alphabet_array.index(first)
      second = second.to_i - 1
      [first, second]
    else
      invalid_input
    end
  end

  def invalid_input
    puts 'Enter valid input'
    input = gets.chomp.split('')
    clean_input(input)
  end

  def valid_alphabet?(input)
    ('a'..'h').include?(input.downcase) ? true : false
  end

  def valid_integer?(input)
    (1..8).include?(input.to_i) ? true : false
  end

  def process_output(array)
    alpha_to_num = ('a'..'h').to_a
    output = alpha_to_num[array[0]]
    output << (array[1] + 1).to_s
  end
end
