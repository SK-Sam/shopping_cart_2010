class Market
    attr_reader :vendors, :name

    def initialize(name)
        @name = name
        @vendors = []
    end

    def add_vendor(vendor)
        @vendors << vendor
    end

    def vendor_names
        @vendors.map do |vendor|
            vendor.name 
        end
    end

    def vendors_that_sell(item)
        @vendors.find_all do |vendor|
            vendor.check_stock(item) > 0
        end
    end

    def total_inventory
        breakdown = {}
        @vendors.each do |vendor|
            vendor.inventory.each do |item, qty|
                if breakdown[item]
                    breakdown[item][:quantity] += qty
                else
                    breakdown[item] = {quantity: qty,
                                        vendors: vendors_that_sell(item)
                                    }
                end
            end
        end
        breakdown
    end

end