def print_board
  odd = "\e[47m       \e[0m\e[40m       \e[0m" * 4 + "\n"
  even = "\e[40m       \e[0m\e[47m       \e[0m" * 4 + "\n"
  print_numbers(odd, even)
  print_alphabets
end

def print_numbers(odd, even)
  (1..8).each do |i|
    if i.even?
      puts "   #{odd} #{9 - i} #{odd}   #{odd}"
    else
      puts "   #{even} #{9 - i} #{even}   #{even}"
    end
  end
end

def print_alphabets
  print '   '
  alphabets = ('a'..'h').to_a
  alphabets.each { |letter| print "   #{letter}   " }
end
