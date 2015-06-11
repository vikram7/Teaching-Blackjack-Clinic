class Hand
  attr_reader :cards, :name, :checker

  def initialize(name)
    @name = name
    @cards = Array.new
    @checker = false
  end

  def add_card(card)
    @cards << card
  end

  def score
    score = 0
    non_ace_cards = @cards.map { |card| card if card.rank != "Ace" }.compact
    ace_cards = @cards.map { |card| card if card.rank == "Ace" }.compact
    non_ace_cards.each do |card|
      score += card.value
    end

    ace_cards.each do |card|
      if score <= 10
        score += 11
      else
        score += 1
      end
    end
    score
  end

  def stand
    @checker = true
  end

  def busts?
    score > 21
  end

  def done?
    checker || busts?
  end

end
