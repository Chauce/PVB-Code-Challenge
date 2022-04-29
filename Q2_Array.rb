# Write a program to calculate grades for students in a classroom.
# Your program should read a CSV that contains the student’s:
#   name,
#   student id,
#   assignment name,
#   and numeric score on the assignment,
# and output:
#   a list of student names
#   and a letter grade based on the average assignment score.
# If a student does not have an entry for an assignment:
#   they should receive a score of 0 for that assignment.
#
# All scores will be:
#   integers between 0 and 100,
# and assignments are named:
#   “Assignment 1”, “Assignment 2”, etc...
#
# The grading scale for the class is as follows
#   90 - 100: A
#   80 - 89: B
#   70 - 79: C
#   55 - 69: D
#   < 55: F
#
# Given the follow CSV file:
#   Sally Student,S001,Assignment 1,95
#   Johnny Readerman,S002,Assignment 1,71
#   Tony Thinkerson,S003,Assignment 1,88
#   Johnny Readerman,S002,Assignment 2,90
#   Sally Student,S001,Assignment 2,100
#   Tony Thinkerson,S003,Assignment 2,57
#   Sally Student,S001,Assignment 3,85
#   Tony Thinkerson,S003,Assignment 3,80
#
# The output should be:
#   Sally Student A
#   Johnny Readerman F
#   Tony Thinkerson C

require 'csv'

filename = ""
in_file = nil
class_array = []

def lettergrade(total)
  avg = (total / 3)
  puts "We got #{avg}"
  letter = case avg
  when 90..100
     'A'
  when 80..90
      'B'
   when 70..80
      'C'
   when 55..70
      'D'
   when 0..55
      'F'
   else
     pp 'Could not find score'
  end
  return letter
end

# Read in file from terminal
puts "Chasya Church -- Student Grade Calculation"
puts "Enter the CSV file path:"
filename = gets.chomp
if File.exists?(filename) && File.readable?(filename) then
  in_file = File.open(filename, "r")

  # Create Array of Hashes from CSV
  CSV.parse(in_file, headers: false) do |row|
    assg_hash = {
      name: row[0],
      id: row[1],
      #assignment: row[2],
      score: row[3].to_i,
    }
    class_array << assg_hash
  end

  pp "class_array: #{class_array}"

  # Sort by Student ID
  sorted_hasharr = class_array.sort_by { |h| h[:id] }

  pp "sorted_hasharr: #{sorted_hasharr}"

  merged_hasharr = sorted_hasharr.each_with_object(Hash.new(0)) { |hsh, e| e[hsh[:name]] += hsh[:score].to_f }.
    sort_by { |_, v| -v }.
    map.
    with_index { |(k, v), i| [{ :student => k, :total => v, :avg => (v/3), :letter => (lettergrade(v))}] }
  pp "merged_hasharr: #{merged_hasharr}"

  else
    puts "#{filename} does not exist or is not readable."
end

puts "---Finished---"
