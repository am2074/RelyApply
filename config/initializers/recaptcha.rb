if Rails.env.production?
	Recaptcha.configure do |config|
	  config.site_key  = Hearback::Application.credentials.RECAPTCHA_SITE_KEY
	  config.secret_key =  Hearback::Application.credentials.RECAPTCHA_SECRET_KEY  
	end
end