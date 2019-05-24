
# TODO: rewrite the user input loop cause its a bit mad right now.
# TODO: Remove extra stuff like height...



def add_student
  puts "enter names of students to add"
  puts "when finished hit return twice"
    name = gets.chomp
  puts "what cohort:"
    cohort = gets.chomp
  while !name.empty? do
    if cohort.empty?
      cohort = "november"
    end
    cohort = cohort.to_sym
    @students_array << {name: name, cohort: cohort}
    puts "name:"
    name = gets.chomp
    if name.empty?
      break
    end
    puts "cohort:"
    cohort = gets.chomp
  end
end

def student_grouping
  grouped_by_cohort = {}
  @students_array.each do |student|
    cohort = student[:cohort]
    if grouped_by_cohort[cohort] == nil
      grouped_by_cohort[cohort] = []
    end
    grouped_by_cohort[cohort].push(student[:name])
  end
  grouped_by_cohort.each do |key, value|
    s_key = key.to_s
    s_key.capitalize!
    puts "----------------------"
    puts "#{s_key} cohort".center(20)
    puts "----------------------"
    value.each do |name|
      puts name.center(20)
    end
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
  # For Challenge 9
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
      save_data
    when "9"
      exit
    else
      puts "Why are you selecting things that arent on the menu do you have mannors?"
  end
end

def save_data
  file = File.open("students.csv", "w")
  # iterate over the students array
  @students_array.each do |student|
    student_data = [student[:name], student[:cohort]]
    csv_line = student_data.join(",")
    file.puts csv_line
  end
  puts "[FILE SAVED!]"
end

def interactive_menu
  @students_array = []
  loop do
    print_menu
    process(gets.chomp)
  end
end
interactive_menu
