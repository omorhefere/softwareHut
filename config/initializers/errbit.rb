Airbrake.configure do |config|
  config.api_key = '78bd69b8fbd8a8900f9b7fca40bcc0b0'
  config.host    = 'errbit.software-hut.org.uk'
  config.port    = 443
  config.secure  = config.port == 443
end
