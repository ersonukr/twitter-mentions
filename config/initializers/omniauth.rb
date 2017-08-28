data = YAML::load_file(File.join(Rails.root, 'config', 'twitter.yml'))[Rails.env]

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :twitter, data['consumer_key'], data['consumer_secret'], {:display => "popup",:x_auth_access_type => 'Read, Write & Direct Messages'}
end

OmniAuth.config.on_failure = Proc.new { |env|
  OmniAuth::FailureEndpoint.new(env).redirect_to_failure
}