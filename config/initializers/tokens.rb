# If an s3.yml file exists, use the key, secret key, and bucket values from there.
# Otherwise, pull them from the environment.
S3 = {}
if File.exists?("#{Rails.root}/config/s3.yml")
  s3_config = YAML.load_file("#{Rails.root}/config/s3.yml")
  S3[:key]    = s3_config[Rails.env]['secret_access_key']
  S3[:secret] = s3_config[Rails.env]['access_key_id']
  S3[:bucket] = s3_config[Rails.env]['bucket']
else
  S3[:key]    = ENV['S3_KEY']
  S3[:secret] = ENV['S3_SECRET']
  S3[:bucket] = ENV['S3_BUCKET']
end

VIMEO = {}
if File.exists?("#{Rails.root}/config/vimeo.yml")
  vimeo_config = YAML.load_file("#{Rails.root}/config/vimeo.yml")
  VIMEO[:consumer_key]    = vimeo_config['CONSUMER_KEY']
  VIMEO[:consumer_secret] = vimeo_config['CONSUMER_SECRET']
  VIMEO[:vimeo_token]     = vimeo_config['VIMEO_TOKEN']
  VIMEO[:vimeo_secret]    = vimeo_config['VIMEO_SECRET']
  VIMEO[:vimeo_account]   = vimeo_config['VIMEO_ACCOUNT_NAME']
else
  VIMEO[:consumer_key]    = ENV['CONSUMER_KEY']
  VIMEO[:consumer_secret] = ENV['CONSUMER_SECRET']
  VIMEO[:vimeo_token]     = ENV['VIMEO_TOKEN']
  VIMEO[:vimeo_secret]    = ENV['VIMEO_SECRET']
  VIMEO[:vimeo_account]   = ENV['VIMEO_ACCOUNT_NAME']
end

AUTO_MAILER = {}
if File.exists?("#{Rails.root}/config/automailer.yml")
  auto_mailer_config = YAML.load_file("#{Rails.root}/config/automailer.yml")
  AUTO_MAILER[:automailer_email]    = auto_mailer_config['automailer_email']
  AUTO_MAILER[:automailer_password] = auto_mailer_config['automailer_password']
else
  AUTO_MAILER[:automailer_email]    = ENV['automailer_email']
  AUTO_MAILER[:automailer_password] = ENV['automailer_password']
end
