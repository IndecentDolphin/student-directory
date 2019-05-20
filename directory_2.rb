# variables
students_array  = [
  {name: "Dr. Hannibal Lecter", cohort: :november},
  {name: "Darth Vader", cohort: :november},
  {name: "Nurse Ratched", cohort: :november},
  {name: "Michael Corleone", cohort: :november},
  {name: "Alex DeLarge", cohort: :november},
  {name: "The Wicked Witch of the West", cohort: :november},
  {name: "Terminator", cohort: :november},
  {name: "Freddy Krueger", cohort: :november},
  {name: "The Joker", cohort: :november},
  {name: "Joffrey Baratheon", cohort: :november},
  {name: "Norman Bates", cohort: :november}
]



def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

def print_student_list(names)
  # Here is the list of students, printed with index, and configured to select student based on Initial name letter
  names.each_with_index do |student, index|
    if student[:name].start_with?("T")
      puts "#{index + 1}. #{student[:name]} #{student[:cohort]} cohort"
    end
  end
end

def print_footer(names)
  # Printing the total amount of students
  puts "Overall, we have #{names.count} great students"
end

print_header
print_student_list(students_array)
print_footer(students_array)
