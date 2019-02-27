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
end

card_values = ["A","A","B","B","C","C","D","D","E","E","F","F","G","G","H","H"].shuffle
card = Card.new(card_values[9])
card.hide
puts card.display_card
