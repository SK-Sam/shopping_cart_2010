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
end