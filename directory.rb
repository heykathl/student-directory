# Empty array in instance variable for all methods to access
@students = []

# # input the students
def input_students
  puts "Please enter the names of the students"
  puts "To finish, just return twice"

  name  = STDIN.gets.chomp
  
  # if someone types something in, it is stored in name variable
  while !name.empty? do 
    @students << {name: name, cohort: :november}
    puts "Now we have #{@students.count} students"
  # ask again
    name = (STDIN.gets.chomp)
  end
end

def interactive_menu
  loop do # 4. repeat from step 1
    print_menu
    process(STDIN.gets.chomp)
  end
end
# 1. print the menu and ask the user what to do
def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list to students.csv"
  puts "4. Load the list from students.csv"
  puts "9. Exit"
end

# show the students
def show_students
  print_header
  print_student_list
  print_footer
end

# 2. read the input and save it into a variable
# 3. do what the user has asked
def process(user_input)
  case user_input
  when "1"
    input_students
  when "2"
    show_students
  when "3"
    save_students
  when "4"
    load_students
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

def save_students
  # open the file
    file = File.open("students.csv", "w")
  # iterate over the student array
    @students.each do |student|
      student_data = [student[:name], student[:cohort]]
      csv_line = student_data.join(",")
      file.puts csv_line
    end
    file.close
  end

def load_students(filename = "students.csv")
  file = File.open("students.csv", "r")
  file.readlines.each do |line|
  name, cohort = line.chomp.split(",")
    @students << {name: name, cohort: cohort.to_sym}
  end
  file.close
end

def try_load_students
  filename = ARGV.first
  return if filename.nil?
  if File.exist?(filename)
    load_students(filename)
    puts "Loaded #{@students.count} from #{filename}."
  else
    puts "Sorry, #{filename} doesn't exist."
    exit
  end
end

try_load_students
interactive_menu


