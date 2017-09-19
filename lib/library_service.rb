class LibraryService
  SYSTEM_FILES = [
    "#{LIBRARY_PATH}/secret.yml",
    "#{LIBRARY_PATH}/list.json"
  ].freeze

  def json_list
    library_list = File.open("#{LIBRARY_PATH}/list.json", 'r')
    library_list.read
  end

  def list
    JSON.parse(json_list)
  end

  def fetch!
    File.open("#{LIBRARY_PATH}/list.json", 'w+') do |f|
      f.write library_hash.to_json
    end
  end

  private

  def library_hash
    pairs = Dir["#{LIBRARY_PATH}/**/*"].map do |file_path|
      next if SYSTEM_FILES.include? file_path
      next if File.directory? file_path

      relative_path =
      file_id = Base64.strict_encode64 "#{API_KEY}:#{File.basename(file_path)}"
      [file_id, file_path]
    end
    pairs.compact.to_h
  end
end
