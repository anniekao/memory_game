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
        board.each { |row| puts reveal_board(row).join("   ")}
    end

    def reveal_board(row)
        row.map do |card|
            if card.face_up
                card.face_value
            else
                :*
            end
        end
    end
end

game = Board.new()
game.populate
game.render
# game.board[0][1].reveal
# game.board[3][1].reveal
# p game.reveal_board(game.board[0])
# p game.reveal_board(game.board[1])
# p game.reveal_board(game.board[2])
# p game.reveal_board(game.board[3])
# p game.reveal_board(game.board[4])

