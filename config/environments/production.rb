Rails.application.configure do
  # Settings specified here will take precedence over those in config/application.rb.

  # Code is not reloaded between requests.
  config.cache_classes = true

  # Eager load code on boot. This eager loads most of Rails and
  # your application in memory, allowing both threaded web servers
  # and those relying on copy on write to perform better.
  # Rake tasks automatically ignore this option for performance.
  config.eager_load = true

  # Full error reports are disabled and caching is turned on.
  config.consider_all_requests_local       = false
  config.action_controller.perform_caching = true

  # Enable Rack::Cache to put a simple HTTP cache in front of your application
  # Add `rack-cache` to your Gemfile before enabling this.
  # For large-scale production use, consider using a caching reverse proxy like nginx, varnish or squid.
  # config.action_dispatch.rack_cache = true

  # Disable Rails's static asset server (Apache or nginx will already do this).
  config.serve_static_assets = true

  # Compress JavaScripts and CSS.
  config.assets.js_compressor = :uglifier
  config.assets.css_compressor = :sass

  # Do not fallback to assets pipeline if a precompiled asset is missed.
  config.assets.compile = true

  # Generate digests for assets URLs.
  config.assets.digest = true

  # Version of your assets, change this if you want to expire all your assets.
  config.assets.version = '1.0'

  # Specifies the header that your server uses for sending files.
  # config.action_dispatch.x_sendfile_header = "X-Sendfile" # for apache
  # config.action_dispatch.x_sendfile_header = 'X-Accel-Redirect' # for nginx

  # Force all access to the app over SSL, use Strict-Transport-Security, and use secure cookies.
  # config.force_ssl = true

  # Set to :debug to see everything in the log.
  # config.log_level = :info
  config.log_level = :debug

  # Prepend all log lines with the following tags.
  # config.log_tags = [ :subdomain, :uuid ]

  # Use a different logger for distributed setups.
  # config.logger = ActiveSupport::TaggedLogging.new(SyslogLogger.new)

  # Use a different cache store in production.
  # config.cache_store = :mem_cache_store

  # Enable serving of images, stylesheets, and JavaScripts from an asset server.
  # config.action_controller.asset_host = "http://assets.example.com"

  # Precompile additional assets.
  # application.js, application.css, and all non-JS/CSS in app/assets folder are already added.
  # config.assets.precompile += %w( search.js )

  # Ignore bad email addresses and do not raise email delivery errors.
  # Set this to true and configure the email server for immediate delivery to raise delivery errors.
  config.action_mailer.raise_delivery_errors = true

  # Enable locale fallbacks for I18n (makes lookups for any locale fall back to
  # the I18n.default_locale when a translation cannot be found).
  config.i18n.fallbacks = true

  # Send deprecation notices to registered listeners.
  config.active_support.deprecation = :notify

  # Disable automatic flushing of the log to improve performance.
  config.autoflush_log = false

  # Use default logging formatter so that PID and timestamp are not suppressed.
  config.log_formatter = ::Logger::Formatter.new

  # Do not dump schema after migrations.
  config.active_record.dump_schema_after_migration = false

  # ExceptionNotifier
  config.middleware.use ExceptionNotification::Rack,
  :email => {
    :email_prefix => "[ERROR: Gotoclassroom] ",
    :sender_address =>'"Notifier" <support@gotoclassroom.com>',
    :exception_recipients => ['dungtqa@gmail.com', 'quachqhuy@yahoo.com']
  }

  config.action_mailer.delivery_method = :ses
  config.action_mailer.perform_deliveries = true
  config.action_mailer.raise_delivery_errors = false
  config.action_mailer.default_url_options = { :host => 'gotoclassroom.com' }

  # Paperclip
  BUCKET_IMG = "gotoclassroom_production_imgs"
  BUCKET_VIDEO = "gotoclassroom_production_videos"
  BUCKET_FILE = "gotoclassroom_production_files"
  PAPERCLIP_STORAGE_OPTIONS = {:storage => :s3,
    :use_ssl => false,
    :s3_protocol => "http",
    :s3_credentials => "#{Rails.root}/config/s3.yml",
    :path => ":attachment/:id/:basename_:style.:extension"
  }

  # App
  LOGIN_URL = "http://gotoclassroom.com/oauth/login_endpoint"
  ACCESS_TOKEN_URL = "http://10.64.1.10/oauth/token"
  CLIENT_ID = "03f8970bd582641d1ee15935603968b1"
  CLIENT_SECRET = "8c526fc0d7ef28da464827448eca7f67"

  PATH_TEMPLATE = "/var/www/themes/default"
  PATH_USER = "/var/www/"
  DOMAIN = "gotoclassroom.com"
  CENTRALIZE_APP_URL = "gotoclassroom.com/centralize_app_store/"
  DASHBOARD_URL = 'http://dashboard.gotoclassroom.com'
  CLASS_URL = 'gotoclassroom.com/#/classdetail-activities/'

  # Omniauth
  TWITTER_KEY = "mmafPo7Fchjv9KzRRXYOvmfrf"
  TWITTER_SECRET = "g3XDrnUkDsQHjv9SoJazVtM6FmQQ3UDQJHH5shPIhdoCQX6ied"

  FACEBOOK_KEY = "1747564452134523"
  FACEBOOK_SECRET = "bdb394e0bbae0349da219bed238d8ca1"

  EMAIL_NOTIFICATION = 'info@gotoclassroom.com'
end