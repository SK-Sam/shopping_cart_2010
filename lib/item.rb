class Item
    attr_reader :name

    def initialize(description)
        @name = description[:name]
        @price = description[:price]
    end

    def price
        @price[1..-1].to_f
    end
end