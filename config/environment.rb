require 'yaml'
require 'base64'

ROOT_PATH = File.expand_path('../../', __FILE__).freeze
LIBRARY_PATH = '/home/wave_bro/library'.freeze
API_KEY = YAML.load_file("#{LIBRARY_PATH}/secret.yml")['api-key'].freeze

# ========= Gems =========
require 'sinatra/base'
require 'redis'
# ========= /Gems ========

# ========= Lib ==========
Dir["#{ROOT_PATH}/lib/**/*.rb"].each { |file| require(file) }
# ========= /Lib =========

# require_relative 'redis'
require_relative 'application'
require_relative 'routes'
