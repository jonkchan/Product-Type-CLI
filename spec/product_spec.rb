require_relative './spec_helper.rb'
require_relative '../lib/product.rb'
require_relative '../lib/json_parser.rb'

describe Product do
  describe 'class properties' do
    before(:example) do
      json = JSONParser.parse_json('./spec/json/test_data.json')
      @test_product = Product.new(json[0])
    end

    it 'expect id property to be available' do
      expect(@test_product).to respond_to(:id)
    end

    it 'expect type property to be available' do
      expect(@test_product).to respond_to(:type)
    end

    it 'expect options property to be available' do
      expect(@test_product).to respond_to(:options)
    end
  end

  describe '.create_products_from_json' do
    before(:example) do
      json = JSONParser.parse_json('./spec/json/test_data.json')
      @product_array = Product.create_products_from_json(json)
    end

    it 'expects to return an array of Products objects from valid JSON file' do
      expect(@product_array.length.positive?).to eq(true)
    end

    it 'expects to return valid Product objects within array' do
      expect(@product_array[0].id).to eq(1)
      expect(@product_array[0].type).to eq('poster')
      expect(@product_array[0].options.key?('genre')).to eq(true)
      expect(@product_array[0].options.key?('size')).to eq(true)
    end
  end
end
