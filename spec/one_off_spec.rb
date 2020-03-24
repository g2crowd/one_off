# frozen_string_literal: true

RSpec.describe OneOff do
  describe '::configure' do
    it 'yields configuration' do
      described_class.configure { |c| c.executor_queue = :critical }
      expect(described_class.configuration.executor_queue).to eq :critical
    end
  end
end
