# Product Class takes in id, product_type, and options from JSON
class Product
  attr_accessor :id, :type, :options, :hierarchy

  def initialize(product_hash)
    @id = product_hash['id']
    @type = product_hash['product_type']
    @options = product_hash['options']
    @hierarchy = product_hash['options'].map { |key, _value| key }.compact
  end

  # Method returns products object array from JSON data
  def self.create_products_from_json(json)
    json.map { |product_hash| Product.new(product_hash) }
  end

  # Helper function compares if product.options matches specified product_options
  def match_options?(product_options)
    product_options.each_with_index do |product_option, idx|
      category = hierarchy[idx]
      return false unless options[category] == product_option
    end
    true
  end
end
