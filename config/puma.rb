workers Integer(ENV['PUMA_WORKERS'] || 3)
threads Integer(ENV['MIN_THREADS']  || 1), Integer(ENV['MAX_THREADS'] || 16)

preload_app!

rackup      DefaultRackup
port        ENV['PORT']     || 3000
environment ENV['RACK_ENV'] || 'production'

daemonize true
<<<<<<< HEAD
pidfile "/var/www/helpy/shared/tmp/pids/puma.pid"
stdout_redirect "/var/www/helpy/shared/tmp/log/stdout", "/var/www/helpy/shared/tmp/log/stderr"

bind "unix:///var/www/helpy/shared/tmp/sockets/puma.sock"
=======
pidfile "/var/www/SysCare_Helpdesk/shared/tmp/pids/puma.pid"
stdout_redirect "/var/www/SysCare_Helpdesk/shared/tmp/log/stdout", "/var/www/SysCare_Helpdesk/shared/tmp/log/stderr"

bind "unix:///var/www/SysCare_Helpdesk/shared/tmp/sockets/puma.sock"
>>>>>>> 922deb23582fd9986dfc04ff0120d688d898251e

on_worker_boot do
  # worker specific setup
  ActiveSupport.on_load(:active_record) do
    config = ActiveRecord::Base.configurations[Rails.env] || Rails.application.config.database_configuration[Rails.env]
    config['pool'] = ENV['MAX_THREADS'] || 16
    ActiveRecord::Base.establish_connection(config)
  end
end
