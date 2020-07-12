require_relative './spec_helper.rb'
require_relative '../lib/json_parser.rb'

describe JSONParser do
  describe '.parse_json' do
    it 'expects an error to be raised for empty file location argument' do
      expect { JSONParser.parse_json('') }.to raise_error(ArgumentError)
    end

    it 'expects an error to be raised for invalid file location argument' do
      expect { JSONParser.parse_json('./spec/json/test.json') }.to raise_error(ArgumentError)
    end

    it 'expects an error to be raised for empty JSON file' do
      expect { JSONParser.parse_json('./spec/json/empty_data.json') }.to raise_error(ArgumentError)
    end

    it 'expects a hash object to be returned for valid json data' do
      expect(JSONParser.parse_json('./json/products.json').is_a?(Array)).to be_truthy
    end
  end
end
