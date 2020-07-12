# Product Class takes in id, product_type, and options from JSON
class Product
  attr_accessor :id, :type, :options

  def initialize(product_hash)
    @id = product_hash['id']
    @type = product_hash['product_type']
    @options = product_hash['options']
  end

  # Method returns products object array from JSON data
  def self.create_products_from_json(json)
    json.map { |product_hash| Product.new(product_hash) }
  end

  # Helper function compares if product.options matches specified product_options
  def match_options?(product_options)
    is_applicable = true
    product_options.each do |option|
      is_applicable = false unless options.value?(option.to_s)
    end
    is_applicable
  end
end
