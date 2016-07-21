# Log queries to STDOUT in development
if Sinatra::Application.development?
  ActiveRecord::Base.logger = Logger.new(STDOUT)
end

# Automatically load every file in APP_ROOT/app/models/*.rb, e.g.,
#   autoload "Person", 'app/models/person.rb'
#
# We have to do this in case we have models that inherit from each other.
# If model Student inherits from model Person and app/models/student.rb is
# required first, it will throw an error saying "Person" is undefined.
#
# With this lazy-loading technique, Ruby will try to load app/models/person.rb
# the first time it sees "Person" and will only throw an exception if
# that file doesn't define the Person class.
#
# See http://www.rubyinside.com/ruby-techniques-revealed-autoload-1652.html
Dir[APP_ROOT.join('app', 'models', '*.rb')].each do |model_file|
  filename = File.basename(model_file).gsub('.rb', '')
  autoload ActiveSupport::Inflector.camelize(filename), model_file
end

# Heroku controls what database we connect to by setting the DATABASE_URL environment variable
# We need to respect that if we want our Sinatra apps to run on Heroku without modification
db = URI.parse(ENV['DATABASE_URL'] || "postgres://localhost/#{APP_NAME}_#{Sinatra::Application.environment}")

DB_NAME = db.path[1..-1]

# Note:
#   Sinatra::Application.environment is set to the value of ENV['RACK_ENV']
#   if ENV['RACK_ENV'] is set.  If ENV['RACK_ENV'] is not set, it defaults
#   to :development

ActiveRecord::Base.establish_connection(
  :adapter  => db.scheme == 'postgres' ? 'postgresql' : db.scheme,
  :host     => db.host,
  :port     => db.port,
  :username => db.user,
  :password => db.password,
  :database => DB_NAME,
  :encoding => 'utf8'
)

require_relative 'aws_secrets'

CarrierWave.configure do |config|                       # required
  config.fog_credentials = {
    provider:              'AWS',                        # required
    aws_access_key_id:     AWS_ACCESS_KEY,                        # required
    aws_secret_access_key: AWS_SECRET_ACCESS_KEY,                        # required
    region:                'us-east-1',                  # optional, defaults to 'us-east-1'
    host:                  'http://s3.amazonaws.com',             # optional, defaults to nil
    endpoint:              'http://s3-us-east-1.amazonaws.com/'
 # optional, defaults to nil
  }
  config.fog_directory  = 'scotchoverflow'                          # required
end

