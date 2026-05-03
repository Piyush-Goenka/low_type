# frozen_string_literal: true

require_relative '../fixtures/custom_class'

RSpec.describe Order do
  subject { described_class.new }

  describe '#process' do
    it 'accepts a user-defined class as a type without raising NameError' do
      expect { subject.process(method: PaymentMethod.new) }.not_to raise_error
    end

    it 'returns the passed value' do
      payment = PaymentMethod.new
      expect(subject.process(method: payment)).to eq(payment)
    end
  end
end
