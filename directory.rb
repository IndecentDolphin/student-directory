# variables
students_array = ["Dr. Hannibal Lecter",
  "Darth Vader",
  "Nurse Ratched",
  "Michael Corleone",
  "Alex DeLarge",
  "The Wicked Witch of the West",
  "Terminator",
  "Freddy Krueger",
  "The Joker",
  "Joffrey Baratheon",
  "Norman Bates"
]

def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

def print_student_list(names)
  # Here is the list of students
  names.each do |student|
    puts student
  end
end

def print_footer(names)
  # Printing the total amount of students
  puts "Overall, we have #{names.count} great students"
end

print_header
print_student_list(students_array)
print_footer(students_array)
