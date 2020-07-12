require_relative './spec_helper.rb'
require_relative '../lib/inventory.rb'
require_relative '../lib/json_parser.rb'

describe Inventory do
  before(:example) do
    json = JSONParser.parse_json('./spec/json/test_data.json')
    @inventory = Inventory.new(json)
  end

  it 'expects products property to be available' do
    expect(@inventory).to respond_to(:products)
  end

  describe '.process_available_options' do
    it 'expects to return no options if product_type is not available' do
      expect(@inventory.process_available_options('teeshirt').empty?).to eq(true)
    end

    it 'expects to return no options if product_option is not available' do
      expect(@inventory.process_available_options('poster', ['faantasy']).empty?).to eq(true)
    end

    it 'expects to return options if product type is available' do
      expect(@inventory.process_available_options('poster').empty?).to eq(false)
    end

    it 'expects to return options if product type and option is available' do
      expect(@inventory.process_available_options('poster', ['fantasy']).empty?).to eq(false)
    end
  end
end
