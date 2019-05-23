
# TODO: rewrite the user input loop cause its a bit mad right now.



def add_student
  puts "enter names of students to add"
  puts "when finished hit return twice"
    name = gets.chomp
  puts "what cohort:"
    cohort = gets.chomp
  puts "height:"
    height = gets.chomp
  while !name.empty? do
    if cohort.empty?
      cohort = "november"
    elsif height.empty?
      height = "N/A"
    end
    cohort = cohort.to_sym
    @students_array << {name: name, cohort: cohort, height: height}
    puts "name:"
    name = gets.chomp
    if name.empty?
      break
    end
    puts "cohort:"
    cohort = gets.chomp
    puts "height:"
    height = gets.chomp
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
    print "#{student[:name]}".center(30)
    print "Height: #{student[:country_of_origin]}".center(20)
    puts "#{student[:cohort]} cohort".center(20)
  end
end

def print_footer
  # Printing the total amount of students
  puts "Overall, we have #{@students_array.count} great students"
end

def print_menu
  puts "1. Add students"
  puts "2. Show student list"
  puts "9. Exit"
end

def show_students
  print_header
  print_student_list_pretty
  print_footer
end

def interactive_menu
  @students_array = []
  loop do
    # 1. print the menu and ask the user what to do
    print_menu()
    # 2. read the input and save it into a variable
    selection = gets.chomp
    # 3. do what the user has asked
    case selection
      when "1"
        add_student()
      when "2"
        show_students()
      when "9"
        exit
    end
    puts "Why are you selecting things that arent on the menu do you have mannors?"
  end
end
interactive_menu
