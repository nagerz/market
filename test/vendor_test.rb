require './lib/vendor'
require 'minitest/autorun'
require 'minitest/pride'

class VendorTest < Minitest::Test
  def setup
    @vendor = Vendor.new("Rocky Mountain Fresh")
  end

  def test_it_exists
    assert_instance_of Vendor, @vendor
  end

  def test_it_has_a_name
    assert_equal "Rocky Mountain Fresh", @vendor.name
  end

  def test_it_starts_with_an_empty_inventory
    expected = {}
    assert_equal expected, @vendor.inventory
  end

  def test_it_can_check_stock_and_defaults_to_0
    assert_equal 0, @vendor.check_stock("Peaches")
  end

  def test_it_can_stock_item
    @vendor.stock("Peaches", 30)

    assert_equal 30, @vendor.check_stock("Peaches")
  end

  def test_it_can_add_to_stock
    @vendor.stock("Peaches", 30)
    @vendor.stock("Peaches", 25)

    assert_equal 55, @vendor.check_stock("Peaches")
  end

  def test_it_can_add_to_stock
    @vendor.stock("Peaches", 30)
    @vendor.stock("Peaches", 25)

    assert_equal 55, @vendor.check_stock("Peaches")
  end

  def test_it_tracks_inventory
    @vendor.stock("Peaches", 30)
    @vendor.stock("Peaches", 25)
    @vendor.stock("Tomatoes", 12)

    expected = {"Peaches"=>55, "Tomatoes"=>12}

    assert_equal expected, @vendor.inventory
  end

end
