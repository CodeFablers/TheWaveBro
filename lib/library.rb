class Library
  SYSTEM_FILES = [
    "#{LIBRARY_PATH}/secret.yml",
    "#{LIBRARY_PATH}/list.json"
  ].freeze

  def plain_list
    library_list = File.open("#{LIBRARY_PATH}/list.json", 'r')
    library_list.read
  end

  def list
    JSON.parse(plain_list)
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

      file_id = Base64.strict_encode64 "#{API_KEY}:#{File.birthtime(file_path)}"
      [file_id, file_path]
    end
    pairs.compact.to_h
  end
end
