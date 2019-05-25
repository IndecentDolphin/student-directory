require 'csv'
@students_array = []

def populate_array(name, cohort)
  cohort.to_sym
  @students_array << {name: name, cohort: cohort}
end

def add_student
  puts "enter names of students to add"
  puts "when finished hit return twice"
    name = STDIN.gets.chomp
  puts "what cohort:"
    cohort = STDIN.gets.chomp
  while !name.empty? do
    cohort.empty? ? cohort = "November" : cohort
    populate_array(name, cohort)
    puts "name:"
    name = STDIN.gets.chomp
    if name.empty?
      break
    end
    puts "cohort:"
    cohort = STDIN.gets.chomp
  end
end

def print_header
  puts "The students of Villains Academy"
  puts "------------------------------------------------"
end

def print_student_list_pretty
  if @students_array.empty?
    puts "There are no students to show!"
  end
  @students_array.each_with_index do |student, index|
    print "#{(index + 1).to_s} ".center(4)
    print "#{student[:name]}".center(10)
    puts "#{student[:cohort]} cohort".center(20)
  end
end

def print_footer
  # Printing the total amount of students
  puts ""
  if @students_array.count > 1
    puts "Overall, we have #{@students_array.count} great students"
  else
    puts "Overall, we have #{@students_array.count} great student"
  end
end

def print_menu
  puts "1. Add students"
  puts "2. Show student list"
  puts "3. Save students to file"
  puts "4. Load students from file"
  puts "9. Exit"
end

def show_students
  print_header
  print_student_list_pretty
  print_footer
end

def process(selection)
  case selection
    when "1"
      add_student
    when "2"
      show_students
    when "3"
      puts "Save as?"
      filename = STDIN.gets.chomp
      save_data(filename)
    when "4"
      puts "Open which file..."
      filename = STDIN.gets.chomp
      load_data(filename)
    when "9"
      puts "Clearing cache..."
      exit
    else
      puts "----------------------------------"
      puts "Why are you selecting things that arent on the menu do you have mannors?"
      puts "----------------------------------"
  end
end

def save_data(filename)
  CSV.open(filename, "wb") do |csv|
    @students_array.each do |student|
      student_data = [student[:name], student[:cohort]]
      csv_string = CSV.generate do |line|
        csv << student_data
      end
    end
  end
  puts "[FILE SAVED!]"
end

def load_data(filename = "students.csv")
  CSV.foreach(filename) do |row|
    name, cohort =  row
    populate_array(name, cohort)
  end
  puts "[FILE LOADED!]"
end


def try_load_students
  filename = ARGV.first
  if filename.nil?
    load_data
  elsif File.exists?(filename)
    load_data(filename)
    puts "Loaded #{@students_array.count} from #{filename}"
  else
    puts "Sorry, #{filename} doesnt exist."
    exit
  end
end

def interactive_menu
  loop do
    print_menu
    process(STDIN.gets.chomp)
  end
end


try_load_students
interactive_menu
