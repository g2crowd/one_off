# frozen_string_literal: true

require 'one_off/migrator'

RSpec.describe OneOff::Migrator do
  let(:glob_files) do
    %w(20200103125235_populate_authors.rb 20200104115235_populate_books.rb 20200105184022_populate_chapters.rb)
  end

  before do
    allow(Dir).to receive(:glob).and_return(glob_files)
  end

  describe '::run' do
    before do
      OneOff::Task.insert_all(%w(20200103125235 20200104115235).map { |v| { version: v } })
      allow(OneOff::ExecutorJob).to receive(:perform_later)
    end

    it 'queues up job for pending files' do
      described_class.run
      expect(OneOff::ExecutorJob).to have_received(:perform_later)
                                       .with(satisfy { |file| file.version == 20200105184022 })
    end

    it 'inserts record into database' do
      expect { described_class.run }.to change(OneOff::Task, :count).by(1)
    end
  end

  describe '::pending_files' do
    before do
      OneOff::Task.insert_all(%w(20200103125235 20200104115235).map { |v| { version: v } })
    end

    it 'returns array of files' do
      expect(described_class.pending_files).to all(be_an_instance_of(OneOff::File))
    end

    it 'returns files not already run' do
      expect(described_class.pending_files.map(&:version)).to eq([20200105184022])
    end
  end

  describe '::matching' do
    it 'returns array of files' do
      expect(described_class.matching('populate_books')).to all(be_an_instance_of(OneOff::File))
    end

    it 'returns files matching pattern' do
      expect(described_class.matching('populate_books').map(&:version)).to eq([20200104115235])
    end
  end
end
