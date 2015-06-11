require_relative "lib/card"
require_relative "lib/deck"
require_relative "lib/hand"

require 'pry'
require 'colorize'

def print_score(hand)
  puts "---------------------------------------------".colorize(:green)
  puts "#{hand.name} has the following cards:"
  hand.cards.each do |card|
    puts card.to_s.colorize(:blue)
  end

  puts "#{hand.name} has a score of #{hand.score}".colorize(:red)
  puts "---------------------------------------------".colorize(:green)
end

deck = Deck.new
player = Hand.new("Player")
dealer = Hand.new("Dealer")

puts "Hi, this is Blackjack. You are my friend."

card = deck.draw!
player.add_card(card)
card = deck.draw!
player.add_card(card)

card = deck.draw!
dealer.add_card(card)
card = deck.draw!
dealer.add_card(card)

print_score(player)
print_score(dealer)

while player.done? == false
  puts "(h)it or (s)tand?: "
  input = gets.chomp.downcase

  if input == "s"
    player.stand
    puts "#{player.name} stands."
  elsif input == "h"
    card = deck.draw!
    player.add_card(card)
  else
    puts "Please enter either (h) to (h)it or (s) to (s)tand."
  end
  print_score(player)
end

if player.busts?
  puts "#{player.name} busted!"
else
  while dealer.score < 17
    card = deck.draw!
    dealer.add_card(card)
  end

  if dealer.busts?
    puts "#{dealer.name} has busted."
  else
    puts "#{dealer.name} stands."

    print_score(player)
    print_score(dealer)

    if dealer.score > player.score
      puts "Dealer wins!"
    elsif player.score > dealer.score
      puts "Player wins!"
    else
      puts "It's a push!"
    end
  end
end
