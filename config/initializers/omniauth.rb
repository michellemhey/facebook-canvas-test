Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, $fb_app_id, $fb_secret, :scope => '', :iframe => true
  OmniAuth.config.full_host = $app_url
end