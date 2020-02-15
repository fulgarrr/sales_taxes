require 'spec_helper'

RSpec.describe OutputHandler do
  let(:normal_row) { Row.new(1, 'normal', 100.00) }
  let(:exempt_row) { Row.new(1, 'exempted', 100.00) }
  let(:import_row) { Row.new(1, 'imported', 100.00) }
  let(:transaction) { Transaction.new([normal_row, exempt_row, import_row]) }

  describe 'methods' do
    describe '#output_to_stdout' do
      it 'outputs to stdout' do
        expect { described_class.output_to_stdout(transaction) }
          .to output.to_stdout
      end
    end

    describe '#output_to_string' do
      it 'outputs to string' do
        example = described_class.output_to_csv(transaction)
        expect(example).to be_a(String)
      end
    end
  end
end
