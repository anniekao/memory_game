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
        cards.each do |card|
            container << card
            if container.length == 4
                board << container
                container = []
            end
        end
    end
    
    def render
        puts "Memory Board:"
        puts " "
        board.each { |row| puts revealBoard(row).join("   ")}
        puts " "
    end

    def revealBoard(row)
        row.map do |card|
            if card.faceUp
                card.faceValue
            else
                :*
            end
        end
    end

    def revealCard(guessPos)
        row, col = convertGuessToArray(guessPos)
        guessedCard = @board[row][col]
        if guessedCard.faceUp == false
            guessedCard.reveal
            return guessedCard.faceValue
        end
    end

    def convertGuessToArray(guessPos)
        guessPos.split(",").map { |num| num.to_i}
    end

    def won?
        cards.each do |card|
            if card.faceUp == false
                return false
            end
        end
        true
    end
end

if __FILE__ == $PROGRAM_NAME
    game = Board.new()

    p game.populate
    # puts "Please enter the position of the card you'd like to flip (e.g. '2,3') to max '4,3'"
    # guess = gets.chomp
    # game.convertGuessToArray(guess)
    # game.revealCard(guess)
    # game.render

end
