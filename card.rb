class Card
    attr_reader :face_value, :face_up
    
    def initialize (face_value)
        @face_value = face_value
        @face_up = false
    end

    def hide
        @face_up = false
    end

    def reveal
        @face_up = true
    end

    def display_card
        if @face_up
            puts @face_value
        elsif !@face_up
            puts ""
        end
    end

    def == (card) #test this!
        self.card == card
    end
end

