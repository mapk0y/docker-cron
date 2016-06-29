FROM debian

RUN apt-get update \
 && apt-get install -y --no-install-recommends \
    cron \
 && apt-get clean \
 && rm -rf /var/cache/apt

RUN echo '* * * * * root TZ=Asia/Tokyo date | tee -a /root/cron-log' | tee -a /etc/crontab

# CRON(8)
# -f      Stay in foreground mode, don't daemonize.
# -L loglevel
#         Tell cron what to log about jobs (errors are logged regardless of this value) as the sum of the following values:
#             1      will log the start of all cron jobs
#             2      will log the end of all cron jobs
#             4      will log all failed jobs (exit status != 0)
#             8      will log the process number of all cron jobs
CMD ["cron", "-f", "-L1"]

