# There are simple list of application actions(routes)
class WaveBro
  before do
    authenticated = KeyVerifier.new(api_key).valid?
    halt(401, 'Not authenticated') unless authenticated
  end

  post '/library/fetch' do
    library.fetch!

    halt 200
  end

  get '/library' do
    content_type :json
    library.json_list
  end

  get '/library/download' do
    file_path = library.list[params[:file_id]]
    send_file file_path
  end

  private

  def library
    @library ||= LibraryService.new
  end

  def api_key
    env['HTTP_API_KEY']
  end
end
