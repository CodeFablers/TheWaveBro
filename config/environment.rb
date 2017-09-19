require 'yaml'
require 'base64'

APP_ENV ||= :dev # Used to switch between test & dev envs
ROOT_PATH = File.expand_path('../../', __FILE__).freeze

if APP_ENV == :dev
  LIBRARY_PATH = '/home/wave_bro/library'.freeze
  secret_path = "#{LIBRARY_PATH}/secret.yml"
  unless File.exists?(secret_path)
    puts('== Please add secret file in the root of your directory. Bye! ==')
    exit(0)
  end
  API_KEY = YAML.load_file(secret_path)['api-key'].freeze
end

# ========= Gems =========
require 'sinatra/base'
require 'redis'
require 'byebug'
require 'awesome_print'
# ========= /Gems ========

# ========= Lib ==========
Dir["#{ROOT_PATH}/lib/**/*.rb"].each { |file| require(file) }
# ========= /Lib =========

# require_relative 'redis'
require_relative 'application'
require_relative 'routes'
