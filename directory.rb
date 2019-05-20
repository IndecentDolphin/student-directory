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

puts "The students of Villains Academy"
puts "-------------"
# Here is the list of students
students_array.each do |student|
  puts student
end
# Printing the total amount of students
puts "Overall, we have #{students_array.count} great students"
