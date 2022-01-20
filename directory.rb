# Empty array in instance variable for all methods to access
@students = []

def input_students
  puts "Please enter the names of the students"
  puts "To finish, just return twice"

  students = []

  name  = gets.chomp
  
  # if someone types something in, it is stored in name variable
  while !name.empty? do 
    @students << {name: name, cohort: :november}
    puts "Now we have #{@students.count} students"
  # ask again
    name = gets.chomp
  end
end

def interactive_menu
  loop do # 4. repeat from step 1
  # 1. print the menu and ask the user what to do
    print_menu
    process(gets.chomp)
  end
end

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "9. Exit"
end

def show_students
  print_header
  print_student_list
  print_footer
end

def process(user_input)
  case user_input
  when "1"
    input_students
  when "2"
    show_students
  when "9"
    exit
  else
    puts "I don't know what you meant, try again"
  end
end

def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

def print_student_list
  @students.each do |student|
    puts "#{student[:name]} (#{student[:cohort]} cohort)"
  end
end

def print_footer
  puts "Overall, we have #{@students.count} great students"
end

interactive_menu

