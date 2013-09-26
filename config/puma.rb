#!/usr/bin/env puma

#directory       '/home/finch/sites/sm.finch.pro/current'
environment     'production'
daemonize
#pidfile         '/home/finch/sites/sm.finch.pro/current/tmp/puma/pid'
#state_path      '/home/finch/sites/sm.finch.pro/current/tmp/puma/state'
stdout_redirect 'log/sm_finch_pro.stdout.log', 'log/sm_finch_pro.stderr.log'
quiet
threads         0, 16
bind            'unix:///home/finch/tmp/sm_finch_pro.sock'
