# Initialize App
class WaveBro < Sinatra::Base
  configure :production, :development do
    enable :logging
  end
end
