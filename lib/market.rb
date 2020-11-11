class Market
    attr_reader :vendors, :name

    def initialize(name)
        @name = name
        @vendors = []
    end

end