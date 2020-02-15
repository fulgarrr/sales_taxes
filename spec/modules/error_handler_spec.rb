require 'spec_helper'

RSpec.describe ErrorHandler do
  describe 'methods' do
    describe '#run' do
      it 'catches Errno::ENOENT' do
        message = "File does not exist.\n"
        expect { described_class.run { raise Errno::ENOENT } }
          .to output(message).to_stdout
      end

      it 'catches KeyError' do
        message = "Ensure that file is formatted properly.\n"
        expect { described_class.run { raise KeyError } }
          .to output(message).to_stdout
      end

      it 'catches StandardError and puts error' do
        message = "MyString\n"
        expect { described_class.run { raise 'MyString' } }
          .to output(message).to_stdout
      end
    end
  end
end
