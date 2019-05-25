# variables
# test data
students_array  = [
  {name: "Dr. Hannibal Lecter", cohort: :november, height: "6ft"},
  {name: "Darth Vader", cohort: :november, height: "7ft"},
  {name: "Nurse Ratched", cohort: :november, height: "6ft"},
  {name: "Michael Corleone", cohort: :janurary, height: "6ft"},
  {name: "Alex DeLarge", cohort: :november, height: "6ft"},
  {name: "The Wicked Witch of the West", cohort: :janurary, height: "3ft"},
  {name: "Terminator", cohort: :november, height: "7ft"},
  {name: "Freddy Krueger", cohort: :november, height: "6ft"},
  {name: "The Joker", cohort: :november, height: "6ft"},
  {name: "Joffrey Baratheon", cohort: :janurary, height: "4ft"},
  {name: "Norman Bates", cohort: :november, height: "6ft"}
]

def add_student

end

def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

def print_student_list_name_filter(names)
  # Here is the list of students, printed with index, and configured to
  # select student based on Initial name letter
  names.each_with_index do |student, index|
    if student[:name].start_with?("T")
      puts "#{index + 1}. #{student[:name]} #{student[:cohort]} cohort"
    end
  end
end

# Challenge 10, another way to modify the string
def clean_string_savage
  name = gets
  name.tr!("\n","")
  puts name
end

# Challenge 3, dependant on name length
def print_students_name_length_filter(names)
  names.each do |student|
    if student[:name].length <= 12
      puts  " #{student[:name]} #{student[:cohort]} cohort"
    end
  end
end

# Challenge 4, rewrite the .each method to more barbaric ways of controlling flow
def print_student_list_savage(array)
  i = 0
  while i < array.length do
    puts array[i][:name]
    i += 1
  end
end

# Challenge 6, pretty formatting for output
def print_student_list_pretty(names)
  names.each_with_index do |student, index|
    print "#{(index + 1).to_s} ".center(4)
    print "#{student[:name]}".center(30)
    print "Height: #{student[:height]}".center(20)
    puts "#{student[:cohort]} cohort".center(20)

    # puts "#{index + 1}. #{student[:name]} height:#{student[:height]} #{student[:cohort]} cohort".center(20, "x")
  end
end




def print_footer(names)
  # Printing the total amount of students
  puts ""
  # For Challenge 9
  if names.count > 1
    puts "Overall, we have #{names.count} great students"
  else
    puts "Overall, we have #{names.count} great student"
  end
end

print_header
# print_student_list(students_array)
print_student_list_pretty(students_array)
# print_students_name_length(students_array)
# print_student_list_savage(students_array)
print_footer(students_array)
