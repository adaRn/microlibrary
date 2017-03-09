# This will raise an error when these environment variables are not set
# during initialisation.
Figaro.require_keys('GOOGLE_CLIENT_ID', 'GOOGLE_CLIENT_SECRET')
