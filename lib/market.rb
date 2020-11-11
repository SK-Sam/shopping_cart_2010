require 'date'

class Market
    attr_reader :vendors, :name, :date

    def initialize(name)
        @name = name
        @vendors = []
        @date = Date.today.strftime("%d/%m/%Y")
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

    def overstocked_items
        overstocked_list = []
        total_inventory.each do |item, info|
            overstocked_list << item if overstocked?(item, info)
        end
        overstocked_list
    end

    def overstocked?(item, info)
        info[:quantity] > 50 && info[:vendors].count > 1
    end

    def sorted_item_list
        @vendors.flat_map do |vendor|
            vendor.inventory.map do |item, qty|
                item.name
            end
        end.uniq.sort
    end
end