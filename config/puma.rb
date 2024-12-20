# Puma configuration file for production
max_threads_count = ENV.fetch("RAILS_MAX_THREADS") { 5 }
min_threads_count = ENV.fetch("RAILS_MIN_THREADS") { max_threads_count }
threads min_threads_count, max_threads_count

# Set worker timeout to 60 seconds in production
worker_timeout 60 if ENV.fetch("RAILS_ENV", "production") == "production"

# Default port to 8080 for production
port ENV.fetch("PORT") { 8080 }

# Running in production environment
environment ENV.fetch("RAILS_ENV") { "production" }

pidfile ENV.fetch("PIDFILE") { "tmp/pids/server.pid" }

# Number of workers to use in production
workers 2

# Preload app for better worker memory management
preload_app!

plugin :tmp_restart