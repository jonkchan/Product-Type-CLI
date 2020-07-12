# Class provides methods to parse JSON
class JSONParser
  # Method returns parsed JSON array based on file_location argument
  def self.parse_json(file_location)
    # Guard Clause: Check if file_location argument exists
    raise ArgumentError, 'File location does not exist' unless File.exist?(file_location)

    json = File.read(file_location)

    # Guard Clause: Check if json file does not contain data
    raise ArgumentError, 'No data available in JSON file' if json.empty?

    JSON.parse(json)
  end
end
