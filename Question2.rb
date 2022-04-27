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

# Read in file from terminal
puts "Chasya Church -- Student Grade Calculation"
puts "Enter the CSV file path:"
csv_data = gets.chomp

class_array = []

# Create Array of Hashes from CSV
CSV.parse(csv_data, headers: false) do |row|
  assg_hash = {
    name: row[0],
    id: row[1],
    #assignment: row[2],
    score: row[3].to_i,
  }
  class_array << assg_hash
end

# Sort by Student ID
sorted_hasharr = class_array.sort_by { |h| h[:id] }

# Merge so your student data has total score
merged_hasharr = sorted_hasharr.
  group_by { |h| h[:id] }.
  values.
  map { |arr| arr.reduce(&:merge) }

# Divide sum by 3 and add (key, val) to hash
avg = 0
n = 3 # Number of Assignments
merged_hasharr.each do |student|
  student.each do |k, v|
    if v.is_a? Integer
      avg = (v / n)
      student.store('avg', avg)
      # Get letter grade
      case avg
        when 90..100
        "A"
        when 80..90
         "B"
        when 70..80
         "C"
        when 60..70
         "D"
        when 0..60
         "F"
        else
       "Error"
      end
      student.store('ltr', case)
    end
  end
end

# Output Student Name and Letter Grade
merged_hasharr.each do |student|
  puts "#{student.name} #{student.ltr}\n"
end
