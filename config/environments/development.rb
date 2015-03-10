Rails.application.configure do
  # Settings specified here will take precedence over those in config/application.rb.

  # In the development environment your application's code is reloaded on
  # every request. This slows down response time but is perfect for development
  # since you don't have to restart the web server when you make code changes.
  config.cache_classes = false

  # Do not eager load code on boot.
  config.eager_load = false

  # Show full error reports and disable caching.
  config.consider_all_requests_local       = true
  config.action_controller.perform_caching = false

  # Don't care if the mailer can't send.
  config.action_mailer.raise_delivery_errors = false

  config.action_mailer.delivery_method = :smtp

  config.action_mailer.smtp_settings = {
    :address              => "smtp.gmail.com",
    :port                 => 587,
    :domain               => 'gmail',
    :user_name            => 'pesomebeta@gmail.com',
    :password             => 'pesome123',
    :authentication       => 'plain',
    :enable_starttls_auto => true,
    :openssl_verify_mode  => 'none'
  }

  config.after_initialize do
    # Bullet.enable = true
    # Bullet.alert = true
    # Bullet.bullet_logger = true
    # Bullet.console = true
    # Bullet.growl = true
    # # Bullet.xmpp = { :account  => 'bullets_account@jabber.org',
    # #                 :password => 'bullets_password_for_jabber',
    # #                 :receiver => 'your_account@jabber.org',
    # #                 :show_online_status => true }
    # Bullet.rails_logger = true
    # Bullet.bugsnag = true
    # Bullet.airbrake = true
    # Bullet.add_footer = true
    # Bullet.stacktrace_includes = [ 'your_gem', 'your_middleware' ]
  end

  #DATNT: configuration for devise
  config.action_mailer.default_url_options = { :host => 'lvh.me:3000' }

  # Print deprecation notices to the Rails logger.
  config.active_support.deprecation = :log

  # Raise an error on page load if there are pending migrations.
  config.active_record.migration_error = :page_load

  # Debug mode disables concatenation and preprocessing of assets.
  # This option may cause significant delays in view rendering with a large
  # number of complex assets.
  config.assets.debug = true

  # Adds additional error checking when serving assets at runtime.
  # Checks for improperly declared sprockets dependencies.
  # Raises helpful error messages.
  config.assets.raise_runtime_errors = true

  # Raises error for missing translations
  # config.action_view.raise_on_missing_translations = true

  # Paperclip
  BUCKET_IMG = ""
  BUCKET_VIDEO = ""
  BUCKET_FILE = ""
  PAPERCLIP_STORAGE_OPTIONS = {}

  GOOGLE_ANALYTICS_PROFILE_ID="72594026" #View id of "All Web Site Data"
  GOOGLE_ANALYTICS_TRACKING_ID="UA-41054687-1"

  # App
  LOGIN_URL = "http://localhost:3000/oauth/login_endpoint"
  ACCESS_TOKEN_URL = "http://localhost:3001/oauth/token"
 CLIENT_ID = "8964983da83d5751cf8ce645b13ee6f1"
 CLIENT_SECRET = "0f239d8872b14b9d5c6cc2ba04338f9b"

 # Ha's config
  # CLIENT_ID = "5b4d137a05b4637ced5929743961654c"
  # CLIENT_SECRET = "9bc8f7003fd9b0b08fd5021f61531f44"
  # CLIENT_ID = "483dd36139fd2a298e4dd6f77b5425b8"
  # CLIENT_SECRET = "8cfaa1b3cb47edd5696f4f6707c5697f"

  PATH_TEMPLATE = "/var/www/gotoclassroom_polymer/app"
  PATH_USER = "/vagrant_data/"
  DOMAIN = "localhost:3000"
  DASHBOARD_URL = 'http://localhost:9000'
  CLASS_URL = 'localhost:9001/#/classdetail-activities/'

  # Omniauth
  TWITTER_KEY = "tWYKJ7rvyqrsZ5JvXGK5eA"
  TWITTER_SECRET = "CaaBy1c9wlyl2YEKrzl2LIERMBkmfOnrU1geULM0E"

  FACEBOOK_KEY = "768178679921174"
  FACEBOOK_SECRET = "42a8ea7351da216b0bacc0d0c7ccdb09"

  EMAIL_NOTIFICATION = 'huynhvietminh012@gmail.com'
end