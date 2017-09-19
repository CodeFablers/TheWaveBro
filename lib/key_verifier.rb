# Used for verifing API key in headers. To be upgrated..
class KeyVerifier
  attr_reader :input

  def initialize(input)
    @input = input
  end

  def valid?
    API_KEY == input
  end
end
