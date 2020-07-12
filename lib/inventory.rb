require_relative 'product.rb'

# This class wraps around the Product class
class Inventory
  attr_accessor :products

  def initialize(json)
    @products = Product.create_products_from_json(json)
  end

  # Method returns hash of available product options
  def process_available_options(product_type, product_options = [])
    output = {}
    products.each do |product|
      # Guard Clause: Check if product type matches
      next if product.type != product_type

      # Guard Clause: Check if product.options matches product_options argument
      next unless product.match_options?(product_options)

      product.options.each do |key, value|
        # Create product options hashmap: <product_option:available options>
        output.store(key, Set.new) unless output.key?(key)

        # Append option unless option is already specified in product_options argument
        output[key] << value unless product_options.include?(value)
      end
    end
    output
  end
end
