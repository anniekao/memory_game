require_relative 'board.rb'
require_relative 'card.rb'

class Memory_Game
    attr_reader :board
    attr_accessor :previousGuess

    def initialize
        @board = Board.new()
        @previousGuess = ""
    end

    def run
        play = true

        until !play
            board.render
            puts "Please enter the position of the card you'd like to flip (e.g. '2,3') to max '4,3'"
            pos = gets.chomp
            make_guess(pos)
            if board.won?
                puts "Congratuations! You win!"
                play = false
            end
        end
    end

    def make_guess(pos)
        previousGuess = pos
        if  board.revealCard(pos) == board.revealCard(previous_guess)
            #card@pos.reveal == true
            #card@previousGuess.reveal == true
            # puts true
            previousGuess.clear
        else
            sleep(5)
            #card@pos.hide
            #card@previousGuess.hide
            previousGuess.clear
        end

        system("clear")
    end
end