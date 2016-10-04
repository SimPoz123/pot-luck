require './scan'

people = "people.csv"
people = open(people)
people_list = people.read

foods = "foods.csv"
foods = open(foods)
foods_list = foods.read

def guest_list(list)
  total_people = 0
  list = list.split(/\n/)

  list.each do |line|
    line = line.split(',')
    total_people += line[2].to_i + 1
  end

  print "#{total_people}\n"
end

guest_list(people_list)

def rsvp(list)
  foods = open("foods.csv", 'a')
  people = open("people.csv", 'a')

  print "What is your name?"
  guest = scan
  guest = guest.delete("\n")

  print "What is your e-mail?"
  email = scan
  email = email.delete("\n")

  print "How many people will be coming with you?"
  guests = scan
  guests = guests.delete("\n")

  print "What food will you be bringing?"
  food = scan
  food = food.delete("\n")

  if list.include?(food) && guests.to_i >= 1 && guests.to_i <= 10
    people_line = guest + "," + email + "," + guests + "," + food + "\n"
    print people_line
    people.write(people_line)

    foods.truncate(0)
    list.slice! ("\n" + food)
    foods.write(list)
  else
    print "You must bring a type of food that is on the list, and you must bring between 1 and 10 people with you."
  end
end

rsvp(foods_list)
