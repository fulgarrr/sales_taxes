require 'spec_helper'

RSpec.describe InputHandler do
  let(:test_file) do
    Tempfile.new('filename.csv').tap do |file|
      file.puts 'Quantity, Product, Price'
      file.puts '1, normal, 100'
      file.puts '1, exempted, 100'
      file.puts '1, imported, 100'

      file.close
    end
  end

  describe 'methods' do
    after { test_file.unlink }

    describe '#get_product_list' do
      it 'returns an Array' do
        example = described_class.get_product_list(test_file)
        expect(example).to be_an(Array)
      end

      it 'returns an Array of Rows' do
        example = described_class.get_product_list(test_file)
        expect(example.last).to be_a(Row)
      end
    end
  end
end
