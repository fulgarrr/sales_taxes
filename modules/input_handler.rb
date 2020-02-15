# this module handles parsing of the CSV input
module InputHandler
  module_function

  def get_product_list(path)
    list = []
    CSV.open(path, headers: true, col_sep: ', ').map do |row|
      list << Row.new(
        row.fetch('Quantity').to_i,
        row.fetch('Product'),
        row.fetch('Price').to_f
      )
    end
    list
  end
end
