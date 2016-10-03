require './scan'

people = "people.csv"
people = open(people)
people_list = people.read

def guest_list(list)
  total_people = 0
  list = list.split(/\n/)

  list.each do |line|
    line = line.split(',')
    total_people += line[2].to_i + 1
  end

  print total_people
end

guest_list(people_list)

def rsvp(list)
  guest = scan
  scan = scan.split(',')
  
end

rsvp(people_list)
