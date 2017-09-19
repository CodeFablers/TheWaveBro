require 'yaml'

APP_ENV = :test
SPEC_PATH = File.expand_path('../', __FILE__).freeze
LIBRARY_PATH = "#{SPEC_PATH}/mock_library".freeze
API_KEY = YAML.load_file("#{LIBRARY_PATH}/secret.yml")['api-key'].freeze

require_relative '../config/environment'
require 'spec_helper'
