#!/usr/bin/env puma

quiet
daemonize
threads         0, 16
environment     'production'
bind            'unix:///home/finch/tmp/sm_finch_pro.sock'
stdout_redirect 'log/sm_finch_pro.stdout.log', 'log/sm_finch_pro.stderr.log'
