def check_winner
  car = open("car_bids.csv").read
  computer = open("computer_bids.csv").read
  headphones = open("headphones_bids.csv").read
  phone = open("phone_bids.csv").read
  socks = open("socks_bids.csv").read

  find_winner(car, "car")
  find_winner(computer, "computer")
  find_winner(headphones, "headphones")
  find_winner(phone, "phone")
  find_winner(socks, "socks")

end

def find_winner(list, prize)
  winner = ""
  highest_bid = 0

  list.each_line do |line|
    line.delete "\n"
    info = line.split(',')
    bid = info[1].to_i
    if bid > highest_bid
      winner = info[0]
      highest_bid = bid
    end
  end

  print "#{winner} won the #{prize} for #{highest_bid}! \n"
end

check_winner
