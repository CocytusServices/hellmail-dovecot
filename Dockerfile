FROM alpine:latest

RUN apk add --no-cache dovecot dovecot-lmtpd dovecot-pigeonhole-plugin \
                       rspamd-client bash sed grep python3 py3-pip py3-requests; \
    rm -rf /etc/dovecot/; \
    pip install mail-parser

ENV DOVECOT_HOSTDOMAIN="local.domain"

EXPOSE 113 143 993 4190

# HEALTHCHECK --interval=30s --timeout=5s --start-period=5s --retries=3 CMD netstat -l | grep smtp

CMD ["/usr/sbin/dovecot", "-F"]
