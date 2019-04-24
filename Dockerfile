FROM nginx:latest as redirector
ENV dest="https://github.com/cryptkid/docker-redirector"
ENV access_log="off"
RUN mkdir /redirector
COPY redirector/ /redirector/
ENTRYPOINT ["/redirector/ENTRYPOINT.sh"]
