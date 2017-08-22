class WaveBro
  get '/catalogue' do
    authenticated = KeyVerifier.new(headers['api-key']).valid?
    return halt(401, 'Not authenticated') unless authenticated

    json: LibraryWatcher.call
  end
end
