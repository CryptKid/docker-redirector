FROM nginx:latest as redirector
ENV dest="https://github.com/cryptkid/docker-redirector"
ENV access_log="off"
ENV keep_uri="false"
ENV acme_404="true"
RUN mkdir /redirector
COPY redirector/ /redirector/
EXPOSE 80
ENTRYPOINT ["/redirector/ENTRYPOINT.sh"]
