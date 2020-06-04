# frozen_string_literal: true

require 'yaml'

RSpec.describe Tinwe::Config do
  let(:file) { StringIO.new }
  let(:exists) { true }

  before do
    allow(File).to receive(:open).and_yield(file)
    allow(file).to receive(:write).and_call_original
    allow(subject).to receive(:init)
    allow(subject).to receive(:exists?).and_return(exists)
    allow(subject).to receive(:settings).and_return(YAML.safe_load(dummy_file.string, [Symbol]))
  end

  describe '#save' do
    let(:settings) { { foo: :bar } }

    before do
      subject.save
    end

    context 'when the config does not exist' do
      let(:exists) { false }

      it 'prepares directories ' do
        expect(subject).to have_received(:exists?)
        expect(subject).to have_received(:init)
      end

      it 'saves the content' do
        expect(File).to have_received(:open).with(subject.send(:config_path), 'w')
        expect(file).to have_received(:write).with(settings.to_yaml)
        expect(file.string).to eq(settings.to_yaml)
      end
    end

    context 'when the config exists already' do
      let(:exists) { true }
      let(:old_settings) { { a: :b } }
      let(:file) { StringIO.new(old_settings.to_yaml) }

      it 'does no prepare directories' do
        expect(subject).to have_received(:exists?)
        expect(subject).not_to have_received(:init)
      end

      it 'replaces the file content' do
        expect(File).to have_received(:open).with(subject.send(:config_path), 'w')
        expect(file).to have_received(:write).with(settings.to_yaml)
        expect(file.string).to eq(settings.to_yaml)
      end
    end
  end

  describe '#add_catalog' do
    let(:settings) { { catalogs: [] } }

    context 'with valid path' do
    end

    context 'with invalid path' do
    end

    context 'with new catalog' do
    end

    context 'with first catalog' do
    end

    context 'with existing catalog' do
    end
  end
end
