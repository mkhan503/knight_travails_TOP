# Processes input to be passed to other classes
module InputOutput
  def clean_input(input)
    alphabet_array = ('a'..'h').to_a
    if first_valid?(input[0]) && second_valid?(input[1])
      input[0] = alphabet_array.index(input[0])
      input[1] = input[1].to_i - 1
      input
    else
      invalid_input
    end
  end

  def invalid_input
    puts 'Enter valid input'
    input = gets.chomp.split('')
    clean_input(input)
  end

  def first_valid?(input)
    ('a'..'h').include?(input.downcase) ? true : false
  end

  def second_valid?(input)
    (1..8).include?(input.to_i) ? true : false
  end

  def process_output(array)
    alpha_to_num = ('a'..'h').to_a
    output = alpha_to_num[array[0]]
    output + (array[1] + 1).to_s
  end
end
