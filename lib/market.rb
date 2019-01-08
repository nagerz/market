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

  def sell(item, quantity)
    if total_inventory[item] < quantity
      return false
    else
      sell_item(item, quantity)
      return true
    end
  end

  def sell_item(item, quantity)
    @vendors.each do |vendor|
      if vendor.check_stock(item) > 0
        vendor_qty = vendor.check_stock(item)
        if vendor_qty >= quantity
          vendor.inventory[item] -= quantity
          return
        else
          vendor.inventory[item] = 0
          quantity -= vendor_qty
        end
      end
    end
  end

end
