require_relative 'inventory.rb'
require_relative 'json_parser.rb'
require 'json'
require 'set'

# Class provides methods to be used in CLI
class CommandLineInterface
  def run(product_type, product_options = [])
    # Guard Clause: Check if non-empty product_type argument was provided
    raise ArgumentError, 'Product type argument required' unless product_type

    # Below file_location argument can be updated to process different json dataset
    json = JSONParser.parse_json('./json/products.json')
    product_inventory = Inventory.new(json)
    options_hash = product_inventory.process_available_options(product_type, product_options)
    display_options(options_hash)
  end

  private

  # Method displays available product options to end user
  def display_options(options_hash)
    # Guard Clause: Check if no product options are available
    if options_hash.empty?
      puts 'No options available for specified Product Type / Option(s)'
      return
    end

    options_hash.each do |key, value|
      # Guard Clause: Check if set value is empty
      next if value.empty?

      puts "#{key.capitalize}: #{value.to_a.join(', ')}"
    end
  end
end
