require "csv"
require "awesome_print"


def get_all_olympic_athletes(olympic_data)

  athletes = CSV.read(olympic_data, headers: true).map do |item|

    {
    "ID" => item["ID"],
    "Name" => item["Name"],
    "Height" => item["Height"],
    "Team" => item["Team"],
    "Year" => item["Year"],
    "City" => item["City"],
    "Sport" => item["Sport"],
    "Event" => item["Event"],
    "Medal" => item["Medal"],
    }

  end
  return athletes  #ap here
end

# pp get_all_olympic_athletes(data/athlete_events.csv)

=begin

Write down a description of 2 test cases that test the core functionality, and are nominal tests.
  1. Check if it returns the right values by testing obvious inputs
  2. Check if it returns the right data type by using must_be_instance_of

How did we "Assert" and check that the method returns an array of hashes?
  1. Iterate through the method output and use 'must_be_instance_of Array', then iterate through the inner hash layer and use
     must_be_instance_of Hash.

How did we "Assert" and check that the method returns an array of hashes with the correct keys?
  1. Iterate through layers of the output. Outer layer should be checked using must_be_instance of Array, and for the inner
     layer, do the same thing but check to match the Hash data type.

How did we "Assert" and check that the method returns an accurate list of Olympic medalists?
  1. Use .length method to determine how long our list is and use that expected value to test the actual value of the methods output.

What nominal tests did we miss?
  1. Which key and value pairs are being analyzed.

Write down descriptions of 2 edge test cases that aren't in our tests.

=end

def total_medals_per_team(olympic_data)

  teams_medals = get_all_olympic_athletes(olympic_data).group_by { |athlete| athlete["Team"] }.map { |k, v| [k, v.size] }.to_h

  return ap teams_medals
end

total_medals_per_team("data/athlete_events.csv")

=begin

Write descriptions for 2 test cases that test the core functionality, and are nominal tests.
  1. If teams with medals are included and those without are excluded.
  2. If expected total medals for a team matches the actual value.

In the tests, how do we "Arrange" and setup the data of all Olympic athletes?
  1. Create a sample data structure storing accurate team and medal information and use those values
     to determine the expected outcome and compare it to the actual outcome of the method.

How did we "Assert" and check that the method returns a hash?
  1. Compare the data structures and use must_be_instance of to test it.

How did we "Assert" and check that the method returns an accurate hash?
  1. Iterate through the sample data structure based on the csv file and for each key/value pair, check to see if
      those values match the actual output of the method.

What nominal tests did we miss?
Write descriptions for 2 edge test cases that aren't in our tests.

=end



# def get_all_gold_medalists(olympic_data)
# end

