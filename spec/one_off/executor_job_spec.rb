# frozen_string_literal: true

require 'one_off/file'

RSpec.describe OneOff::ExecutorJob do
  subject(:job) { described_class.new }

  describe '#perform' do
    let(:file) { OneOff::File.new(filename) }

    context 'when method not implemented' do
      let(:filename) { '20200319101852_populate_authors' }

      it 'raises error' do
        expect { job.perform(file) }.to raise_error NotImplementedError
      end
    end

    context 'when environment matches' do
      let(:filename) { '20200322151832_populate_books' }

      it 'executes file' do
        expect { job.perform(file) }.to raise_error ArgumentError, 'Raising for specs'
      end
    end

    context 'when environment does not match' do
      let(:filename) { '20200323162030_populate_chapters' }

      it 'does not execute file' do
        expect { job.perform(file) }.not_to raise_error
      end
    end
  end
end
