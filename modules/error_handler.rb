# this module handles runs the block and catches errors
module ErrorHandler
  module_function

  def run
    yield
  rescue Errno::ENOENT
    puts 'File does not exist.'
  rescue KeyError
    puts 'Ensure that file is formatted properly.'
  rescue StandardError => e
    puts e
  end
end
