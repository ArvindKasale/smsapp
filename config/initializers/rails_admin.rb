RailsAdmin.config do |config|
  config.authorize_with :cancan
  config.excluded_models << "User"
end
