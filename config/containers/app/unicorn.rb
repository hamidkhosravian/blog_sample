# Set unicorn options
worker_processes 4
preload_app true
timeout 120

# Set up socket location
# listen "#{tmp_dir}/sockets/unicorn.sock", backlog: 64
listen "0.0.0.0:8080", tcp_nopush: true

# Logging
stderr_path "log/unicorn.stderr.log"
stdout_path "log/unicorn.stdout.log"

# Set master PID location
pid "tmp/pids/unicorn.pid"
