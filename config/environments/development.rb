Rails.application.configure do
  # Verifies that versions and hashed value of the package contents in the project's package.json
  config.webpacker.check_yarn_integrity = true
  # Settings specified here will take precedence over those in config/application.rb.

  # In the development environment your application's code is reloaded on
  # every request. This slows down response time but is perfect for development
  # since you don't have to restart the web server when you make code changes.
  config.cache_classes = true

  # Do not eager load code on boot.
  config.eager_load = false

  # Show full error reports.
  config.consider_all_requests_local = true

  # Enable/disable caching. By default caching is disabled.
  # Run rails dev:cache to toggle caching.
  if Rails.root.join('tmp', 'caching-dev.txt').exist?
    config.action_controller.perform_caching = true

    config.cache_store = :memory_store
    config.public_file_server.headers = {
      'Cache-Control' => "public, max-age=#{2.days.to_i}"
    }
  else
    config.action_controller.perform_caching = false

    config.cache_store = :null_store
  end

  # Store uploaded files on the local file system (see config/storage.yml for options)
  config.active_storage.service = :local

  # Don't care if the mailer can't send.
  config.action_mailer.raise_delivery_errors = false

  config.action_mailer.perform_caching = false

  # Print deprecation notices to the Rails logger.
  config.active_support.deprecation = :log

  # Raise an error on page load if there are pending migrations.
  config.active_record.migration_error = :page_load

  # Highlight code that triggered database queries in logs.
  config.active_record.verbose_query_logs = true

  # Debug mode disables concatenation and preprocessing of assets.
  # This option may cause significant delays in view rendering with a large
  # number of complex assets.
  config.assets.debug =  false
  
  # Suppress logger output for asset requests.
  config.assets.quiet = true

  # Raises error for missing translations
  # config.action_view.raise_on_missing_translations = true

  # Use an evented file watcher to asynchronously detect changes in source code,
  # routes, locales, etc. This feature depends on the listen gem.
  config.file_watcher = ActiveSupport::EventedFileUpdateChecker
config.action_mailer.perform_deliveries = true
config.action_mailer.raise_delivery_errors = true
config.action_mailer.default :charset => "utf-8"
config.action_mailer.default_url_options = { :host => 'localhost:3000' }
config.action_mailer.perform_deliveries = true
config.action_mailer.raise_delivery_errors = true  
config.read_encrypted_secrets = true
config.action_mailer.delivery_method = :smtp
config.action_mailer.smtp_settings = {
  :address              => 'smtp.zoho.com',
  :port                 => 465,
  :domain               => 'relyapply.com',
  :user_name            => Hearback::Application.credentials.SUPPORT_RELYAPPLY_EMAIL,
  :password             => Hearback::Application.credentials.SUPPORT_RELYAPPLY_EMAIL_PW,
  :authentication       => :login,
  :ssl                  => true,
  :enable_starttls_auto => true
}
#config.action_mailer.delivery_method = :smtp
#config.action_mailer.smtp_settings = {
  #address:              'smtp.zoho.com',
  #port:                 465,
  #domain:               'zoho.com',
  #user_name:            'support@relyapply.com',
  #password:             'Aznforever13!zoho',
  #authentication:       'plain',
  #enable_starttls_auto: true }
ENV['FACEBOOK_APP_ID'] = Hearback::Application.credentials.FACEBOOK_APP_ID;
ENV['FACEBOOK_SECRET'] = Hearback::Application.credentials.FACEBOOK_SECRET;
ENV['GOOGLE_SIGN_IN_CLIENT_ID'] = Hearback::Application.credentials.GOOGLE_SIGN_IN_CLIENT_ID;
ENV['GOOGLE_SIGN_IN_SECRET'] = Hearback::Application.credentials.GOOGLE_SIGN_IN_SECRET;
ENV['GOOGLE_SIGN_IN_SECRET'] = Hearback::Application.credentials.GOOGLE_SIGN_IN_SECRET;
ENV['SUPPORT_RELYAPPLY_EMAIL'] = Hearback::Application.credentials.SUPPORT_RELYAPPLY_EMAIL;
ENV['SUPPORT_RELYAPPLY_EMAIL_PW'] = Hearback::Application.credentials.SUPPORT_RELYAPPLY_EMAIL_PW;
#config.after_initialize do
  #Bullet.enable = false
  #Bullet.alert = false
  #Bullet.bullet_logger = false
  #Bullet.console = false
#end


end