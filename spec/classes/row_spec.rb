require 'spec_helper'

RSpec.describe Row do
  let(:normal_row) { Row.new(1, 'normal', 100.00) }
  let(:exempt_row) { Row.new(1, 'exempted', 100.00) }
  let(:import_row) { Row.new(1, 'imported', 100.00) }
  let(:multiple_row) { Row.new(5, 'multiple', 100.00) }
  let(:exempt_import_row) { Row.new(1, 'exempted imported', 100) }

  describe 'initializer' do
    it 'initializes @quantity as Integer' do
      expect(normal_row.quantity).to be_an(Integer)
    end

    it 'initializes @name as String' do
      expect(normal_row.name).to be_a(String)
    end

    it 'initializes @price as Float' do
      expect(normal_row.price).to be_a(Float)
    end
  end

  describe 'methods' do
    describe '#exempted?' do
      context 'when not exempted' do
        it 'returns false' do
          expect(normal_row).to_not be_exempted
        end
      end

      context 'when exempted' do
        it 'returns true' do
          expect(exempt_row).to be_exempted
        end
      end
    end

    describe '#imported?' do
      context 'when not imported' do
        it 'returns false' do
          expect(normal_row).to_not be_imported
        end
      end

      context 'when imported' do
        it 'returns true' do
          expect(import_row).to be_imported
        end
      end
    end

    describe '#net?' do
      it 'returns product of @quantity and @price' do
        expect(multiple_row.net).to eq(500)
      end
    end

    describe '#tax' do
      context 'when not exempt' do
        context 'when not imported' do
          it 'returns 10% tax' do
            expect(normal_row.tax).to eq(10)
          end
        end

        context 'when imported' do
          it 'returns 15% tax' do
            expect(import_row.tax).to eq(15)
          end
        end
      end

      context 'when exempt' do
        context 'when not imported' do
          it 'returns 0% tax' do
            expect(exempt_row.tax).to eq(0)
          end
        end

        context 'when imported' do
          it 'returns 5% tax' do
            expect(exempt_import_row.tax).to eq(5)
          end
        end
      end
    end
  end
end
