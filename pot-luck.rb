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


def fundraiser
  print "What is your name?\n"
  name = scan
  name = name.delete("\n")

  print "There are five items available in the silent auction.\n"
  show_prizes

  print "Select which number prize you would like to bid on.\n"
  prize = scan
  prize = prize.delete("\n")

  print "How much would you like to bid?\n"
  bid = scan
  bid = bid.delete("\n")

  add_bid(name, bid, prize)
end

def show_prizes
  prizes = ["A Car", "A Computer", "A Pair of Headphones", "A Phone", "A Pair of Socks"]
  count = 0
  prizes.each do |prize|
    count += 1
    print "#{count}. #{prize}\n"
  end
end

def add_bid(name, bid, prize)
  car = open("car_bids.csv", 'a')
  computer = open("computer_bids.csv", 'a')
  headphones = open("headphones_bids.csv", 'a')
  phone = open("phone_bids.csv", 'a')
  socks = open("socks_bids.csv", 'a')

  line =   name + ',' + bid + "\n"
  print line

  if prize == "1"
    car.write(line)
  elsif prize == "2"
    computer.write(line)
  elsif prize == "3"
    headphones.write(line)
  elsif prize == "4"
    phone.write(line)
  elsif prize == "5"
    socks.write(line)
  else
    "Please choose the number prize you wish to bid on."
  end

  print "#{name} bid #{bid} dollars for prize number #{prize}! \n"
end

fundraiser
