# this module handles outputting, both to standard out and CSV
module OutputHandler
  module_function

  def output_to_csv(transaction)
    CSV.generate(col_sep: ', ') do |csv|
      transaction.product_list.each do |row|
        csv << [row.quantity, row.name, format('%.2f', row.net + row.tax)]
      end
    end
  end

  def output_to_stdout(transaction)
    transaction.product_list.each do |row|
      puts format('%i, %s, %.2f', row.quantity, row.name, row.net + row.tax)
    end

    puts ''
    puts format('Sales Taxes: %.2f', transaction.tax_total)
    puts format('Total: %.2f', transaction.net_total + transaction.tax_total)
  end
end
