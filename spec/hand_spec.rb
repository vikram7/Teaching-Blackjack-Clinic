require "spec_helper"

RSpec.describe Hand do
  let(:hand) { Hand.new("Player 1") }
  let(:non_face_card) { Card.new('3', 'Hearts') }
  let(:face_card) { Card.new('Queen', 'Hearts') }
  let(:ace1) { Card.new('Ace', 'Spades') }
  let(:ace2) { Card.new('Ace', 'Hearts') }
  let(:ace3) { Card.new('Ace', 'Clovers') }
  let(:ace4) { Card.new('Ace', 'Diamonds') }

  describe ".new" do
    it "initializes a hand with no cards" do
      expect(hand.cards).to eq([])
    end
  end

  it "has a name" do
    expect(hand.name).to eq("Player 1")
  end

  describe "#add_card" do
    it "adds a face card to the hand" do
      hand.add_card(face_card)
      expect(hand.cards).to eq([face_card])
    end

    it "adds a non face card to the hand" do
      hand.add_card(non_face_card)
      expect(hand.cards).to eq([non_face_card])
    end
  end

  describe "#score" do
    it "non-ace card hand score" do
      hand.add_card(non_face_card)
      expect(hand.score).to eq(3)
    end

    it "Ace is valued at 11 when the current score <= 10" do
      hand.add_card(non_face_card)
      hand.add_card(ace1)
      expect(hand.score).to eq(14)
    end

    it "Ace is valued at 1 when the current score >= 11" do
      hand.add_card(face_card)
      hand.add_card(non_face_card)
      hand.add_card(ace1)
      expect(hand.score).to eq(14)
    end
  end

  describe "#busts?" do
    it "returns true if score > 21" do
      hand.add_card(Card.new("10", "Hearts"))
      hand.add_card(Card.new("10", "Diamonds"))
      hand.add_card(Card.new("5", "Diamonds"))
      expect(hand.busts?).to eq(true)
    end
  end

  describe "#done?" do
    it "returns true if player stands" do
      hand.stand
      expect(hand.done?).to eq(true)
    end

    it "returns true if player busts" do
      hand.add_card(Card.new("10", "Hearts"))
      hand.add_card(Card.new("10", "Diamonds"))
      hand.add_card(Card.new("5", "Diamonds"))
      hand.busts?
      expect(hand.done?).to eq(true)
    end
  end

end
