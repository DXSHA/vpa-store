FROM node:8
LABEL maintainer "DXSh <DXSh@ya.ru>, VamShop <vamshop@gmail.com>"

ENV NGINX_CODENAME stretch
#ENV VAMSHOP_VERSION 0.36.0
ENV VPA_VERSION master
ENV STORE_PORT 3000

# install requirements and NGINX
RUN echo "deb http://nginx.org/packages/debian/ ${NGINX_CODENAME} nginx" >> /etc/apt/sources.list \
	&& apt-get update && apt-get install --no-install-recommends --no-install-suggests -y --force-yes \
		gettext-base\
		bash \
		zip \
		unzip \
		wget \
		curl \
		nano \
		ca-certificates \
		nginx

# install PM2
RUN npm install pm2 -g

# download project
RUN mkdir -p /var/www \
    && cd /var/www \
    && wget -O vpa-store.zip https://github.com/DXSHA/vpa-store/archive/$VPA_VERSION.zip \
    && unzip vpa-store.zip \
    && rm vpa-store.zip \
    && mv vpa-store-$VPA_VERSION vpa-store

# Nginx config
RUN cd /var/www/vpa-store \
	&& mv nginx/nginx.conf /etc/nginx/ \
	&& mv nginx/default.conf.template /etc/nginx/conf.d/ 

# script to run Nginx and PM2
RUN cd /var/www/vpa-store \
	&& mv docker-entrypoint.sh /usr/local/bin/ \
	&& chmod +x "/usr/local/bin/docker-entrypoint.sh"

# build project
RUN cd /var/www/vpa-store \
	&& npm install \
	&& npm cache clean --force \
	&& npm run build

WORKDIR /var/www/vpa-store

EXPOSE 80

# start Nginx, PM2
ENTRYPOINT ["/usr/local/bin/docker-entrypoint.sh"]