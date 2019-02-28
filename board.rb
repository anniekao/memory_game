require_relative 'card.rb'

class Board
    CARDS = ("A".."J").to_a

    attr_accessor :cards, :board

    def initialize
        @board = []
        @cards = []
        
        CARDS.each do |card|
            2.times do
                @cards << Card.new(card)
            end
        end
        @cards.shuffle!
    end

    def populate
        container = []
        @cards.each do |card|
            container << card
            if container.length == 5
                @board << container
                container = []
            end
        end
    end
    
    def render
        puts "Memory Board:"
        @boards.each do |row|
            reveal(row)
        end
    end
end

