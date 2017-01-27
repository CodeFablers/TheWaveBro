ROOT_PATH = File.expand_path('../../', __FILE__).freeze

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
