class KeyVerifier
  attr_reader :input

  def initialize(input)
    @input = input
  end

  def valid?
    API_KEY == input
  end
end
