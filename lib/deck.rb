class Deck
  attr_reader :cards

  RANKS = (2..10).to_a.map {|num| num.to_s } + ['Jack', 'Queen', 'King', 'Ace']
  SUITS = ['Diamonds', 'Clovers', 'Hearts', 'Spades']

  def initialize
    @cards = Array.new
    RANKS.each do |rank|
      SUITS.each do |suit|
        @cards << Card.new(rank, suit)
      end
    end
    @cards.shuffle!
  end

  def draw!
    @cards.pop
  end

end
