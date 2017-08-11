OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, '1594152533929347', '5220935ac9f9fe5b2d501ed8c8ce8283'
end
