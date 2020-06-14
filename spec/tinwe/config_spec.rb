# frozen_string_literal: true

require 'yaml'

RSpec.describe Tinwe::Config do
  let(:dummy_file) { StringIO.new(settings.to_yaml) }
  let(:exists) { true }
  let(:settings) { {} }

  before do
    allow(File).to receive(:open).and_yield(dummy_file)
    allow(dummy_file).to receive(:write).and_call_original
    allow(subject).to receive(:init)
    allow(subject).to receive(:exists?).and_return(exists)
    allow(subject).to receive(:settings).and_return(YAML.safe_load(dummy_file.string))
  end

  describe '#save' do
    let(:settings) { { 'foo' => 'bar' } }

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
        expect(dummy_file).to have_received(:write).with(settings.to_yaml)
        expect(dummy_file.string).to eq(settings.to_yaml)
      end
    end

    context 'when the config exists already' do
      let(:exists) { true }
      let(:new_settings) { { 'bar' => 'foo' } }

      before do
        allow(subject).to receive(:settings).and_return(new_settings)
      end

      it 'does no prepare directories' do
        expect(subject).to have_received(:exists?)
        expect(subject).not_to have_received(:init)
      end

      it 'replaces the file content' do
        expect(File).to have_received(:open).with(subject.send(:config_path), 'w')
        expect(dummy_file).to have_received(:write).with(settings.to_yaml)
        expect(dummy_file.string).to eq(settings.to_yaml)
      end
    end
  end

  describe '#add_catalog' do
    let(:catalog_name) { 'default' }
    let(:catalog_path) { File.expand_path('../fixtures/catalogs/default.dat', __dir__) }

    context 'with valid path' do
      before do
        subject.add_catalog(catalog_name, catalog_path)
      end

      it 'adds the catlog' do
        catalogs = subject.settings['catalogs']

        expect(catalogs).not_to be_nil
        expect(catalogs.size).to equal(1)
        expect(catalogs.first['name']).to eq(catalog_name)
        expect(catalogs.first['path']).to eq(catalog_path)
      end

      context 'with the catalog already existing' do
        before do
          subject.add_catalog(catalog_name, catalog_path)
          expect(subject.settings['catalogs'].first['name']).to eq(catalog_name)
        end

        context 'with different path' do
          let(:new_catalog_path) { File.expand_path('../fixtures/catalogs/default_other.dat', __dir__) }

          it 'updates the catalog' do
            subject.add_catalog(catalog_name, new_catalog_path)

            expect(subject.settings['catalogs'].first['name']).to eq(catalog_name)
            expect(subject.settings['catalogs'].first['path']).to eq(new_catalog_path)
          end
        end

        context 'with same path' do
          it 'does not change the catalog' do
            subject.add_catalog(catalog_name, catalog_path)

            expect(subject.settings['catalogs'].first['name']).to eq(catalog_name)
            expect(subject.settings['catalogs'].first['path']).to eq(catalog_path)
          end
        end
      end
    end

    context 'with invalid path' do
      let(:catalog_path) { File.expand_path('../fixtures/catalogs/non_existing.dat', __dir__) }

      it 'does not add the catalog' do
        allow(subject).to receive(:save).and_call_original

        expect { subject.add_catalog(catalog_name, catalog_path) }
          .to raise_error(Tinwe::Errors::CatalogNotFound)

        expect(subject).not_to have_received(:save)
        expect(subject.settings['catalogs']).to be_nil
      end
    end
  end

  describe '#find_catalog' do
    let(:settings) { { 'catalogs' => [{ 'name' => 'dummy', 'path' => 'dummy_path' }] } }
    let(:catalog) { subject.find_catalog(catalog_name) }

    context 'with existing catalog' do
      let(:catalog_name) { 'dummy' }

      it 'finds the catalog' do
        expect(catalog).not_to be_nil
        expect(catalog['name']).to eq(catalog_name)
        expect(catalog['path']).to eq(settings['catalogs'].first['path'])
      end
    end

    context 'with not existing catalog' do
      let(:catalog_name) { 'foo' }

      it 'returns nil' do
        expect(catalog).to be_nil
      end
    end
  end
end
