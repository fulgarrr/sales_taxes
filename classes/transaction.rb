# this object represents a single transaction of multiple products
class Transaction
  attr_reader :product_list

  def initialize(product_list)
    @product_list = product_list
  end

  def net_total
    @product_list.map { |row| row.quantity * row.price }.sum
  end

  def tax_total
    @product_list.map { |row| row.quantity * row.tax }.sum
  end
end
