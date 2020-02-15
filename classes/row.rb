# this object represents a single row in the product list
class Row
  attr_reader :quantity, :name, :price

  def initialize(quantity, name, price)
    @quantity = quantity
    @name = name
    @price = price
  end

  def exempted?
    EXEMPTED_KEYWORDS.match(name)
  end

  def imported?
    IMPORTED_KEYWORDS.match(name)
  end

  def net
    @quantity * @price
  end

  def tax
    tax = 0
    tax += @quantity * ((@price * 0.10 / 5).ceil(2) * 5) unless exempted?
    tax += @quantity * ((@price * 0.05 / 5).ceil(2) * 5) if imported?
    tax
  end
end
