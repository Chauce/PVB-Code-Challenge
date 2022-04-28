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

# Read in file from terminal
puts "Chasya Church -- Student Grade Calculation"
puts "Enter the CSV file path:"
filename = gets.chomp
if File.exists?(filename) && File.readable?(filename) then
  in_file = File.open(filename, "r")
  # # Create Array of Arrays from CSV
  # rows = CSV.open(filename).each.to_a
  #
  # pp "All CSV info: #{rows}"
  # # Sort by Student ID
  # sorted_arr = rows.sort_by { |s_id| s_id[1] }
  # pp "Sorted CSV info: #{sorted_arr}"
  # # Turn scores into integers
  # scores_arr = sorted_arr.map { |scores| scores[3].to_i}
  # pp "scores_arr is: #{scores_arr}"
  # pp "sorted_arr is: #{sorted_arr}"
  #
  # sorted_arr.each do |student|
  #   student.each do |value|
  #     pp "student is #{student} and value is #{value}" #<< scores_arr[s][v]
  #
  #     pp "student[3] is #{student[3]}" #<< scores_arr[s][v]
  #     if value.is_integer?
  #       sorted_arr[3]
  #   end
  # end
  # pp " CSV has int scores: #{scores_arr}"

  

  # Create individual arrays for students, summing together scores
  #sum_arr = scores_arr.group_by(&:first).map {|name, score| [name, score.sum(&:last)] }
  #pp "Each student should have their own array: #{sum_arr}"

   # While a[2] == b[2], sum+= a,b,c[4]
   # Divide sum by 3
   # Push average to new[3]
   # Find letter grade for average
   # Push letter grade to new[4]
   # Push entire new student array to array of arrays


  else
    puts "#{filename} does not exist or is not readable."
end
 puts "---Finished---"
