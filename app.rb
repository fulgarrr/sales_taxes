require_relative 'initializer'

ErrorHandler.run do
  raise 'Missing arguments.' unless ARGV[0]

  file = ARGV[0]
  product_list = InputHandler.get_product_list(file)
  transaction = Transaction.new(product_list)
  OutputHandler.output_to_stdout(transaction)
end
