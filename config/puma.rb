threads 2, 32
workers 4
bind 'tcp://0.0.0.0:4567'
stdout_redirect './log/stdout.log', './log/errors.log'
preload_app!
