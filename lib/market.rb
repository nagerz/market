class Market
  attr_reader :name,
              :vendors

  def initialize(name)
    @name = name
    @vendors = []
  end

  def add_vendor(vendor)
    @vendors << vendor
  end

  def vendor_names
    @vendors.map {|vendor| vendor.name}
  end

  def vendors_that_sell(item)
    @vendors.find_all {|vendor| vendor.inventory.include? (item)}
  end

  def sorted_item_list
    items = []
    @vendors.each do |vendor|
      items << vendor.inventory.keys
    end
    items.flatten.uniq!.sort
  end

  def total_inventory
    inventory_list = Hash.new(0)
    @vendors.each do |vendor|
      vendor.inventory.each do |item|
        inventory_list[item[0]] += item[1]
      end
    end
    inventory_list

  end

end
