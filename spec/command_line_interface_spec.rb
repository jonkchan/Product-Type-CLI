require_relative './spec_helper.rb'
require_relative '../lib/command_line_interface.rb'
require 'set'

describe CommandLineInterface do
  describe '.run' do
    before(:example) do
      @cli = CommandLineInterface.new
    end

    describe 'handles edge cases' do
      it 'with missing or empty product_type argument' do
        expect { @cli.run }.to raise_error(ArgumentError)
      end

      it 'with unavailable product_type or product option(s)' do
        display_message = 'No options available for specified Product Type / Option(s)'
        expect(@cli.run('teeshirt')).to eq(display_message)
        expect(@cli.run('tshirt', ['maale'])).to eq(display_message)
        expect(@cli.run('tshirt', ['male', 'gray'])).to eq(display_message)
      end
    end

    it 'returns list of options for valid product type with 0 product option' do
      results = @cli.run('tshirt')

      expect(results.key?('gender')).to eq(true)
      expect(results['gender']).to eq(Set['male', 'female'])

      expect(results.key?('color')).to eq(true)
      expect(results['color']).to eq(Set['red', 'green', 'navy', 'white', 'black'])

      expect(results.key?('size')).to eq(true)
      expect(results['size']).to eq(Set['small', 'medium', 'large', 'extra-large', '2x-large'])
    end

    it 'returns list of options for valid product type with 1 product option' do
      results = @cli.run('tshirt', ['male'])

      expect(results['gender'].empty?).to eq(true)
      expect(results['color']).to eq(Set['red', 'green', 'navy', 'white', 'black'])
      expect(results['size']).to eq(Set['small', 'medium', 'large', 'extra-large', '2x-large'])
    end

    it 'returns list of options for valid product type with 2 product options' do
      results = @cli.run('tshirt', ['male', 'black'])

      expect(results['gender'].empty?).to eq(true)
      expect(results['color'].empty?).to eq(true)
      expect(results['size']).to eq(Set['small', 'medium', 'large', 'extra-large', '2x-large'])
    end
  end
end
