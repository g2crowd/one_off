# frozen_string_literal: true

RSpec.describe OneOff::File do
  subject(:file) { described_class.new(filename) }

  describe '::all' do
    it 'returns correct number of files' do
      expect(described_class.all.size).to eq 3
    end

    it 'returns correct type' do
      expect(described_class.all).to all(be_an_instance_of(described_class))
    end
  end

  describe '::find' do
    it 'returns file with matching version' do
      expect(described_class.find(20200322151832)).to have_attributes(id: 20200322151832, version: 20200322151832,
                                                                      task_name: 'populate_books')
    end
  end

  describe '#version' do
    let(:filename) { '20200323162030_populate_chapters' }

    it 'returns file version' do
      expect(file.version).to eq 20200323162030
    end
  end

  describe '#task_name' do
    let(:filename) { '20200323162030_populate_chapters' }

    it 'returns correct value' do
      expect(file.task_name).to eq 'populate_chapters'
    end
  end
end
