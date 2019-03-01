class Card
    attr_reader :faceValue, :faceUp

    def initialize (faceValue)
        @faceValue = faceValue
        @faceUp = false
    end

    def hide
        @faceUp = false
    end

    def reveal
        @faceUp = true
    end

    def displayCard
        if @faceUp
            puts @faceValue
        elsif !@faceUp
            puts ""
        end
    end

    def == (card) #test this!
        self.card == card
    end
end

