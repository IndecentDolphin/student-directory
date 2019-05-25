# variables
students_array = []
@valid_months = [
  "january",
   "february",
   "march",
   "april",
   "may",
   "june",
   "july",
   "august",
   "september",
   "october",
   "november",
   "december"]

def validate(cohort)
  @valid_months.include?(cohort.downcase) ?  true : false
end

def get_cohort
  puts "what cohort"
  while true do
    cohort = gets.chomp
    if cohort.empty?
      cohort = "november"
    end
    validation = validate(cohort)
    puts "validation has returned #{validation}"
    if validation == true
      break
    else
      puts "invalid month, try again"
    end
  end
  return cohort
end


# Challenge 5, added
def add_student
  student = []
  puts "enter names of students to add"
  puts "when finished hit return twice"
  name = gets.chomp
  cohort = get_cohort
  puts "cohort is #{cohort}"
  puts "what is their country of origin"
  c_o_o = gets.chomp

  if c_o_o.empty?
    c_o_o = "N/A"
  end
  while !name.empty? do
    # cohort = cohort.to_sym
    student << {name: name, cohort: cohort.to_sym, country_of_origin: c_o_o}
    puts "next name:"
    name = gets.chomp
    cohort = get_cohort
    puts "country of origin?"
    c_o_o = gets.chomp
  end
  student
end


# Challenge 8, group the students
def student_grouping(array)
  grouped_by_cohort = {}
  array.each do |student|
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


def print_student_list(names)
  # Here is the list of students
  # Here is challenge 12
  if !names.empty?
    names.each do |student|
      puts "#{student[:name]} #{student[:cohort]} cohort"
    end
  else
    puts "There are no students to display :o"
  end
end

def print_footer(names)
  # Printing the total amount of students
  puts "Overall, we have #{names.count} great students"
end

students_array = add_student
print_header
# print_student_list(students_array)
student_grouping(students_array)
print_footer(students_array)
