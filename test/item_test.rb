require 'minitest/autorun'
require './lib/item'

class ItemTest < MiniTest::Test

    def setup
        @item = Item.new({name: 'Tomato', price: '$0.50'})
    end

    def test_it_can_instantiate
        assert_equal "Tomato", @item.name
        assert_equal 0.5, @item.price
    end
end