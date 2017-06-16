FROM alpine:3.5

VOLUME ["/data"]

RUN apk --update --no-cache add squid acf-squid \
  # Point cache directory to /data
  && rm -fr /var/cache/squid \
  && ln -sf /data /var/cache/squid \
  && rm -fr /var/cache/apk/* \
    /tmp/* \
    /root/.cache \
    /root/.cached
    
ADD src/ /

ENTRYPOINT [ "/docker-entrypoint.sh" ]
CMD [ "squid" ]
EXPOSE 3128 3130
