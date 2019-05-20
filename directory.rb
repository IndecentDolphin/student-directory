# variables
students_array_backup  = [
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

students_array = []


def add_student
  student = []
  puts "enter names of students to add"
  puts "when finished hit return twice"
  name = gets.chomp

  while !name.empty? do
    student << {name: name, cohort: :november}
    name = gets.chomp
  end
  student
end

def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

def print_student_list(names)
  # Here is the list of students
  names.each do |student|
    puts "#{student[:name]} #{student[:cohort]} cohort"
  end
end

def print_footer(names)
  # Printing the total amount of students
  puts "Overall, we have #{names.count} great students"
end

students_array = add_student
print_header
print_student_list(students_array)
print_footer(students_array)
