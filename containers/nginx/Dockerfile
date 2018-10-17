FROM nginx:1.14

COPY ./rootfs /

RUN usermod -u 1000 www-data

CMD ["nginx"]

EXPOSE 80 443