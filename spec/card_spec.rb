require "spec_helper"

RSpec.describe Card do
  let(:non_face_card) { Card.new('9', 'Spades') }
  let(:face_card) { Card.new('Queen', 'Diamonds') }

  it 'has a rank' do
    expect(non_face_card.rank).to eq('9')
  end

  it 'has a suit' do
    expect(non_face_card.suit).to eq('Spades')
  end

  describe "#value" do
    it 'returns the numerical value of a non face card' do
      expect(non_face_card.value).to eq(9)
    end

    it 'returns 10 for a face card' do
      expect(face_card.value).to eq(10)
    end
  end

  describe "#to_s" do
    it "prints out a face card's rank and suit in a nice format" do
      expect(face_card.to_s).to eq("Queen of Diamonds")
    end

    it "prints out a non-face card's rank and suit in a nice format" do
      expect(non_face_card.to_s).to eq("9 of Spades")
    end
  end

end
