FROM node:8.11.2-onbuild
EXPOSE 8443
COPY config.json-default config.json
RUN openssl req \
    -new \
    -newkey rsa:4096 \
    -days 365 \
    -nodes \
    -x509 \
    -subj "/C=BR/ST=Denial/L=Sampa/O=Dis/CN=fumasa.online" \
    -keyout privkey.pem \
    -out fullchain.pem
CMD npm run solid start
