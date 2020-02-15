require 'spec_helper'

RSpec.describe Transaction do
  let(:normal_row) { Row.new(1, 'normal', 100.00) }
  let(:exempt_row) { Row.new(1, 'exempted', 100.00) }
  let(:import_row) { Row.new(1, 'imported', 100.00) }
  let(:transaction) { Transaction.new([normal_row, exempt_row, import_row]) }

  describe 'initializer' do
    it 'initializes @product_list as Array' do
      expect(transaction.product_list).to be_an(Array)
    end
  end

  describe 'methods' do
    describe '#net_total' do
      it 'returns sum of the totals of all rows' do
        expect(transaction.net_total).to eq(300)
      end
    end

    describe '#tax_total' do
      it 'returns sum of the taxes of all rows' do
        expect(transaction.tax_total).to eq(25)
      end
    end
  end
end
