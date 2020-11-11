require 'minitest/autorun'
require './lib/item'
require './lib/vendor'
require './lib/market'

class MarketTest < MiniTest::Test

    def setup
        @market = Market.new("South Pearl Street Farmers Market")
    end

    def test_it_can_instantiate
        assert_equal "South Pearl Street Farmers Market", @market.name
        assert_equal [], @market.vendors
    end
end