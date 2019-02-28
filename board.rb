require_relative 'card.rb'

class Board
    CARDS = ["A","B","C","D","E","F","G","H"]
    attr_accessor :cards

    def initialize
        @cards = []
        
        CARDS.each do |card|
            2.times do
                @cards << Card.new(card)
            end
        end
        @cards.shuffle!
    end
end
