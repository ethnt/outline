PADRINO_ENV = 'test' unless defined?(PADRINO_ENV)

require File.expand_path(File.dirname(__FILE__) + '/../config/boot')

FactoryGirl.find_definitions

RSpec.configure do |conf|
  conf.include Rack::Test::Methods
  conf.include FactoryGirl::Syntax::Methods

  conf.before :suite do
    DatabaseCleaner.strategy = :truncation
    DatabaseCleaner.clean_with :truncation
  end

  conf.before do
    DatabaseCleaner.start
  end

  conf.after do
    DatabaseCleaner.clean
  end
end

def app(app = nil & blk)
  @app ||= block_given? ? app.instance_eval(& blk) : app
  @app ||= Padrino.application
end

def response
  last_response
end
