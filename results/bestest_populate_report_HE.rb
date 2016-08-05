# This takes data from OpenStudio server csv file and populates a copy of the Standard 140 Results spreadsheets
# See steps below taken prior to running this script.

# Run OpenStudio server projects from "integration testing directory"
# The reporting measure in the project contains runner.registerValues objects that in turn get written into the results csv.
# In the future the runner.registerValue data will live in the OSW file with each datapoint.
# run scrpint from directory script is in "Results"

# requires
require 'csv'
require 'fileutils'
require 'rubyXL' # install gem first
# gem documentation # http://www.rubydoc.info/gems/rubyXL/1.1.12/RubyXL/Cell
# https://github.com/weshatheleopard/rubyXL



# Load in CSV file
csv_file = 'bestest_os_server_output_he.csv'
csv_hash = {}
CSV.foreach(csv_file, :headers => true, :header_converters => :symbol, :converters => :all) do |row|
  short_name = row.fields[6].split(" ").first
  csv_hash[short_name] = Hash[row.headers[1..-1].zip(row.fields[1..-1])]
end
puts "CSV has #{csv_hash.size} entries."
puts "Hash keys are #{csv_hash.keys}" # keys made from column 6

# Copy Excel File
orig_results_5_4 = 'resources/RESULTS5-4.xlsx'
copy_results_5_4 = 'RESULTS5-4.xlsx'
puts "Making a copy of #{orig_results_5_4}"
FileUtils.cp(orig_results_5_4, copy_results_5_4)

# Load Excel File
workbook = RubyXL::Parser.parse(copy_results_5_4)
worksheet = workbook['YourData']
puts "Loading #{worksheet.sheet_name} Worksheet"

# todo - update content

# Save Updated Excel File
puts "Saving #{copy_results_5_4}"
workbook.write(copy_results_5_4)