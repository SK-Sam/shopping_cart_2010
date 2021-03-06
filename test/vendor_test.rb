require 'minitest/autorun'
require './lib/vendor'
require './lib/item'

class VendorTest < MiniTest::Test

    def setup
        @item1 = Item.new({name: 'Peach', price: "$0.75"})
        @item2 = Item.new({name: 'Tomato', price: '$0.50'})
        @vendor = Vendor.new("Rocky Mountain Fresh")
    end

    def test_it_can_instantiate
        assert_equal "Rocky Mountain Fresh", @vendor.name
        expected = {}
        assert_equal expected, @vendor.inventory
    end

    def test_it_can_check_stock_for_specific_item
        assert_equal 0, @vendor.check_stock(@item1)
    end

    def test_it_can_stock_item_and_qty
        @vendor.stock(@item1, 30)

        expected_inventory = {@item1 => 30}
        assert_equal expected_inventory, @vendor.inventory
        assert_equal 30, @vendor.check_stock(@item1)

        @vendor.stock(@item1, 25)

        assert_equal 55, @vendor.check_stock(@item1)
        
        @vendor.stock(@item2, 12)

        assert_equal 12, @vendor.check_stock(@item2)
        expected_inventory_2 = {@item1 => 55, @item2 => 12}
        assert_equal expected_inventory_2, @vendor.inventory
    end

    def test_it_can_check_potential_revenue
        item3 = Item.new({name: "Peach-Raspberry Nice Cream", price: "$5.30"})
        item4 = Item.new({name: "Banana Nice Cream", price: "$4.25"})
        vendor2 = Vendor.new("Ba-Nom-a-Nom")
        vendor3 = Vendor.new("Palisade Peach Shack")
        @vendor.stock(@item1, 35)
        @vendor.stock(@item2, 7)
        vendor2.stock(item4, 50)
        vendor2.stock(item3, 25)
        vendor3.stock(@item1, 65)

        assert_equal 29.75, @vendor.potential_revenue
        assert_equal 345.00, vendor2.potential_revenue
        assert_equal 48.75, vendor3.potential_revenue
    end
end