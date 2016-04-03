require 'byebug/core'
# Byebug.wait_connection = true
if Rails.env.development?
  Byebug.start_server( 'localhost', ENV.fetch( 'BYEBUGPORT', 3001 ).to_i )
end
