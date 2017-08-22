require 'yaml'

class KeyVerifier
  def initialize(input)
    @input = input
  end

  def valid?
    original = YAML.load_file("#{ROOT_PATH}/secret.yml")['api-key']
    original == input
  end
end
