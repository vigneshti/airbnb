# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_auth_logic_session',
  :secret      => '1293cc45ca301d323208af29ae552b9106c749110f62fb961baecb35b76f4ae7c917f92a7edd6c88a6fdfb80a5d20b5fb11406f2c61bae2908ff2f7c6135329d'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
