def say_hi
  puts "Hello User"
end

def print_menu
  puts "1 > Hello Computer"
  puts "2 > View source code"
  puts "3 > Bye!"
end

def print_source_code
  source_code = $0
  File.open(source_code, "r") do |file|
    file.readlines.each do |line|
      puts line
    end
  end
end

def main_menu(selection)
  case selection
  when "1"
    say_hi
  when "2"
    print_source_code
  when "3"
    puts "bye then"
    exit
  else
    "Unknown"
  end
end


def console
  loop do
    print_menu
    main_menu(gets.chomp)
  end
end

console
