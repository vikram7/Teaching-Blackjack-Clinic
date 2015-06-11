class Card
  attr_reader :rank, :suit

  def initialize(rank, suit)
    @rank = rank
    @suit = suit
  end

  def value
    if rank == 'Queen' || rank == 'King' || rank == 'Jack'
      10
    else
      rank.to_i
    end
  end

  def to_s
    "#{rank} of #{suit}"
  end

end
